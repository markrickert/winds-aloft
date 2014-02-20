class StationsController < ActionController::API
  def index
    render :json => Stations.all
  end
end
