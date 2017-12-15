class RequestsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.create(request_params)
    @request.parent_email = current_parent.email
    @request.sitter_email = params[:request][:sitter_email]

    if @request.save
      redirect_to '/'
    else
      redirect_to @sitter
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def request_params
    params.require(:request).permit(:sitter_email, :parent_email, :start_time, :end_time, :cost)
  end

end
