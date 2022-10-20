class ServicesController < ApplicationController
  def index
    @services = Service.all
  end

  def show
    @service = Service.includes(:requests).order("requests.date": :desc).find(params[:id])
  end
end
