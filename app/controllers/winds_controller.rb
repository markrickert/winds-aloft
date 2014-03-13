class WindsController < ActionController::API

  def index
    expires_in $redis.ttl(Winds::REDIS_KEY).seconds, public: true
    render :json => Winds.all
  end

end
