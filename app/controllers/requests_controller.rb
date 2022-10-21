class RequestsController < ApplicationController
  def index
    @requests = Request.order(date: :desc).page(params[:page])
  end

  def show
    @request = Request.find(params[:id])
  end

  def search
    if params[:search].blank?
      redirect_to requests_path  and return
    else
      parameter = params[:search].downcase
      service = Service.all.where("lower(service_request) LIKE :search", search: "%#{parameter}%").first
      if service
        @requests = Request.where(service_id: service.id).order(date: :desc).page(params[:page])
      else
        redirect_to requests_path  and return
      end
    end
  end
end
