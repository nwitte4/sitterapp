class SittersController < ApplicationController

  def index
    @sitter = Sitter.find(params[:format])
    @requests = Request.all.where(sitter_email: @sitter.email)
    @notes = Note.all.where(sitter_id: @sitter.id)
  end

  def show
    @sitter = Sitter.find(params[:id])
    @requests = Request.all.where(sitter_email: @sitter.email)
  end

  private

  def sitter_params
      params.require(:sitter).permit(:email, :password)
  end

end
