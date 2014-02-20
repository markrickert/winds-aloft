class StationsController < ActionController::API
  def index
    expires_in 1.week, public: true
    render :json => Stations.all
  end
end
