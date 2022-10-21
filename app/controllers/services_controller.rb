class ServicesController < ApplicationController
  def index
    @services = Service.page(params[:page])
  end

  def show
    @service = Service.includes(:requests).find(params[:id])

    @requests = @service.requests.order(date: :desc).page(params[:page])
  end
end
