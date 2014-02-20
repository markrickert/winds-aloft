class StationsController < ActionController::API

  def index
    render :json => {test: "something"}
  end
end
