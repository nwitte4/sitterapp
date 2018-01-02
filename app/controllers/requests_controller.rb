class RequestsController < ApplicationController
  def index
  end

  def show
    @request = Request.find(params[:id])
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.create(request_params)
    @request.parent_email = current_parent.email
    @request.sitter_email = params[:request][:sitter_email]
    @request.description = 'No details' if @request.description == ""
    @sitter = Sitter.where(email: params[:request][:sitter_email])

    if @request.save
      redirect_to '/'
    else
      redirect_to @sitter, notice: @request.errors.full_messages.each
    end
  end

  def update
  end

  def edit
  end

  def destroy
    request = Request.find(params[:id])
    sitter = Sitter.where(email: request.sitter_email.last)
    request.destroy

    redirect_to '/'
  end

  private

  def request_params
    params.require(:request).permit(:sitter_email, :parent_email, :start_time, :end_time, :cost, :description)
  end

end
