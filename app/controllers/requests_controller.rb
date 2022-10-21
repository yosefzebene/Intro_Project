class RequestsController < ApplicationController
  def index
    @requests = Request.order(date: :desc).page(params[:page])
  end

  def show
    @request = Request.find(params[:id])
  end
end
