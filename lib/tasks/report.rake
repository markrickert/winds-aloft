desc "Finds inconsistencies in stations and actual reports."
task :report => :environment do
  stations = Stations.all
  station_codes = stations.map{ |s| s[:code] }.uniq

  wind_codes = Winds.airport_codes

  puts 'Stations not included in forecast:'
  ap station_codes - wind_codes

  puts 'Forecast codes not included in stations:'
  ap wind_codes - station_codes

  puts 'Use this url to get more station data:'
  puts "http://airports.pidgets.com/v1/airports/#{(wind_codes - station_codes).join(',')}?format=json"
end
