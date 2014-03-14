class WindsController < ActionController::API
  def index
    data = Winds.all
    expires_in $redis.ttl(Winds::REDIS_KEY).seconds, public: true
    render :json => data
  end
end
