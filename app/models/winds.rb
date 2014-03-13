class Winds
  require 'nokogiri'
  require 'open-uri'
  require 'json'
  require 'cgi'

  REDIS_KEY = 'winds'
  VALID_KEY = 'valid'
  HEADER_INDICATOR = 'ft'

  def self.all
    return new.scraper

    new.scraper unless $redis.exists(REDIS_KEY)
    JSON.parse($redis.get(REDIS_KEY))
  end

  def self.airport_codes
    all.keys
  end

  def scraper
    winds_html = scrape_http('http://aviationweather.gov/products/nws/all')
    data = winds_html.xpath('//pre').first.content

    split = data.split("\n\n")
    @header = split.first
    @body = split.last

    # Get dem times
    header_data = parse_header_data
    $redis.set(VALID_KEY, valid(header_data[:valid]))

    winds = {}
    to_a.each do |station|
      station = line_a(station)
      code = station.first

      next if code.downcase == HEADER_INDICATOR

      winds[code] = {}
      winds[code][:raw] = station.join(' ')
      column_headers.each_with_index do |header, i|
        next if header.downcase == HEADER_INDICATOR # Always skip the header

        winds[code][header] = parse_raw_data(station[i], header.to_i)
      end
    end
    $redis.set(REDIS_KEY, winds.to_json)

    usage = use(header_data[:use])
    expire = usage.end.to_i - Time.now.utc.to_i

    $redis.expire(REDIS_KEY, expire)
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
      opts[:temp] = data[4..-1].to_i
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

  def parse_header_data
    data = @header.split("\n")

    opts = {}
    opts[:based_on] = data.find { |d| d.downcase.strip.start_with?('data based on') }.strip

    valid = data.find { |d| d.downcase.strip.start_with?('valid') }
                .split(/(\s\s)|\./)
                .collect(&:strip)
                .reject(&:empty?)

    opts[:valid] = valid.find { |d| d.downcase.start_with?('valid') }.strip
    opts[:use]   = valid.find { |d| d.downcase.start_with?('for use') }.strip
    opts
  end

  # Gets a front-padded array of the one line we're asking for.
  def line_a(line)
    total_count = column_headers.count
    line = line.split(' ')

    if line.count != total_count
      (total_count - line.count).times do
        line.insert(1, '')
      end
    end
    line
  end

  def valid(string)
    Time.parse(string.split(' ').last.scan(/.{1,2}/).join(':'))
  end

  def use(string)
    parts = string.split('-')
    from = Time.parse(parts.first.delete('Z').scan(/.{1,2}/).join(':').concat(' Z'))
    till = Time.parse(parts.last.delete('Z').scan(/.{1,2}/).join(':').concat(' Z'))

    (from..till)
  end

  # Turns the body of the result into an array
  def to_a
    @a ||= @body.lines.to_a
  end

  # Grabs the headers of all the columns
  def column_headers
    @column_headers ||= to_a.find { |line| line.split(' ').first.downcase == HEADER_INDICATOR }.split(' ')
  end

  def scrape_http(url)
    return Nokogiri::HTML(open(url).read)
  end
end
