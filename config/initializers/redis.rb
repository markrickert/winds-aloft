require "net/http"
require "uri"

REDIS_URL = ENV["REDIS_URL"] || "redis://localhost:6379"

if REDIS_URL != nil
  uri = URI.parse(REDIS_URL)
  $redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
end
