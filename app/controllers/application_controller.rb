class ApplicationController < ActionController::API

  def index
    render :json => Winds.all
  end

end
