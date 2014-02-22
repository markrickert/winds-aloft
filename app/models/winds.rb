class Winds
  require 'nokogiri'
  require 'open-uri'
  require 'json'
  require 'cgi'

  REDIS_KEY = 'winds'
  HEADER_INDICATOR = 'ft'

  def self.all
    new.scrape_winds unless $redis.exists(REDIS_KEY)
    JSON.parse($redis.get(REDIS_KEY))
  end

  def self.airport_codes
    all.keys
  end

  def scrape_winds
    winds_html = scrape_http('http://aviationweather.gov/products/nws/all')
    data = winds_html.xpath('//pre').first.content

    split = data.split("\n\n")
    @header = split.first
    @body = split.last

    winds = {}
    to_a.each do |station|
      station = line_a(station)
      code = station.first

      next if code.downcase == HEADER_INDICATOR

      winds[code] = {}
      column_headers.each_with_index do |header, i|
        next if header.downcase == HEADER_INDICATOR

        winds[code][header] = parse_raw_data(station[i], header.to_i)
      end
    end
    $redis.set(REDIS_KEY, winds.to_json)
  end

  def parse_raw_data(data, elevation)
    opts = {
      bearing: 0,
      speed: 0,
      temp: nil,
      raw: data
    }
    if data.strip == ""
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
      if opts[:bearing] > 50
        opts[:bearing] = opts[:bearing] - 50
        opts[:speed] = opts[:speed] + 100
      end
      opts[:bearing] = opts[:bearing].to_s.concat("0").to_i

    end

    opts[:temp] = 0 - opts[:temp] if elevation > 24000
    opts
  end

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

  def to_a
    @a ||= @body.lines.to_a
  end

  def column_headers
    @headers ||= to_a.find { |line| line.split(' ').first.downcase == HEADER_INDICATOR }.split(' ')
  end

  def scrape_http(url)
    return Nokogiri::HTML(open(url).read)
  end
end
