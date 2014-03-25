require "net/http"
require "uri"

REDIS_URL = ENV["REDIS_URL"] || "redis://172.17.0.2:49153"

if REDIS_URL != nil
  uri = URI.parse(REDIS_URL)
  $redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
end
