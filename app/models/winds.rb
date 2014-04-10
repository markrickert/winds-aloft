class Winds
  require 'nokogiri'
  require 'open-uri'
  require 'json'
  require 'cgi'

  REDIS_KEY = 'winds'
  DATA_KEY  = 'data'
  HEADER_INDICATOR = 'ft'

  def self.all
    if $redis.get(REDIS_KEY).nil?
      new.scraper
    else
      {
        data: JSON.parse($redis.get(DATA_KEY)),
        winds: JSON.parse($redis.get(REDIS_KEY))
      }
    end
  end

  def self.airport_codes
    all.keys
  end

  def scraper

    urls = [
      'http://aviationweather.gov/products/nws/all',
      'http://aviationweather.gov/products/nws/hawaii',
      'http://aviationweather.gov/products/nws/alaska'
    ]

    header_data = []
    winds_data = []

    urls.each do |scrape_url|
      puts "Scraping URL: #{scrape_url}"

      winds_html = scrape_http(scrape_url)
      data = winds_html.xpath('//pre').first.content
      split = data.split("\n\n")
      body_lines = split.last.lines

      # Parse header data
      header_data << parse_header_data(split.first)
      height_headers = column_headers(body_lines)

      winds = {}
      body_lines.each do |station|
        station = line_a(station, height_headers)
        code = station.first

        next if code.downcase == HEADER_INDICATOR

        winds[code] = {}
        winds[code][:raw] = station.join(' ')

        height_headers.each_with_index do |header, i|
          next if header.downcase == HEADER_INDICATOR # Always skip the header

          winds[code][header] = parse_raw_data(station[i], header.to_i)
        end
      end
      winds_data << winds
    end

    winds_merged = {}
    winds_data.each do |ww|
      winds_merged =  winds_merged.merge(ww)
    end

    $redis.del(REDIS_KEY)
    $redis.set(REDIS_KEY, winds_merged.to_json)

    $redis.del(DATA_KEY)
    $redis.set(DATA_KEY, header_data.first.to_json)

    usage = use(header_data.first[:use])
    expire = usage.end.to_i - Time.now.utc.to_i

    $redis.expire(REDIS_KEY, expire)

    {
      scraped: true,
      data: header_data.first,
      winds: winds_merged
    }
  end

  def parse_raw_data(data, elevation)
    opts = {
      bearing: nil,
      speed: nil,
      temp: nil,
      raw: data
    }

    if data.strip == ''
      return opts
    elsif data[0,4] == '9900'
      # Winds are "light and variable"
      # Only care about the temp
      temp = data[4..-1]
      opts[:temp] = (temp == "") ? nil : temp.to_i
    else
      opts[:bearing] = data[0,2].to_i
      opts[:speed] = data[2,2].to_i
      opts[:temp] = data[4..-1].to_i unless data.length == 4

      # Account for speeds over 100 knots
      if opts[:bearing] > 36
        opts[:bearing] = opts[:bearing] - 50
        opts[:speed] = opts[:speed] + 100
      end

      # Account for speeds over 200 knots
      opts[:speed] = "200+" if opts[:speed] == 199

      # Make sure the bearing is 3 digits
      opts[:bearing] = opts[:bearing].to_s.concat('0').to_i
    end

    opts[:temp] = -opts[:temp] if elevation > 24000
    opts
  end

  def parse_header_data(header)
    data = header.split("\n")

    opts = {}
    opts[:based_on] = data.find { |d| d.downcase.strip.start_with?('data based on') }.strip

    valid = data.find { |d| d.downcase.strip.start_with?('valid') }
                .split(/(\s\s)|\./)
                .collect(&:strip)
                .reject(&:empty?)

    opts[:valid] = valid.find { |d| d.downcase.start_with?('valid') }.strip
    opts[:use]   = valid.find { |d| d.downcase.start_with?('for use') }.strip
    opts[:expires] = Time.zone.parse(opts[:valid].split(' ').last.scan(/.{1,2}/)[1..-1].join(':'))
    opts
  end

  # Gets a front-padded array of the one line we're asking for.
  def line_a(line, height_headers)
    total_count = height_headers.count
    line = line.split(' ')

    if line.count != total_count
      (total_count - line.count).times do
        line.insert(1, '')
      end
    end
    line
  end

  def use(string)
    parts = string.split('-')
    from = Time.parse(parts.first.delete('Z').scan(/.{1,2}/).join(':').concat(' Z'))
    till = Time.parse(parts.last.delete('Z').scan(/.{1,2}/).join(':').concat(' Z'))

    (from..till)
  end

  # Grabs the headers of all the columns
  def column_headers(data)
    data.find { |line| line.split(' ').first.downcase == HEADER_INDICATOR }.split(' ')
  end

  def scrape_http(url)
    return Nokogiri::HTML(open(url).read)
  end
end
