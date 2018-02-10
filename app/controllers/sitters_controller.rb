class SittersController < ApplicationController

  def index
    @sitter = Sitter.find(params[:format])
    @requests = Request.all.where(sitter_email: @sitter.email).order('start_time ASC').where("start_time >= ?", Time.now - 24.hours)
    @notes = Note.all.where(sitter_id: @sitter.id)
  end

  def show
    @sitter = Sitter.find(params[:id])
    @requests = Request.all.where(sitter_email: @sitter.email).order('start_time ASC').where("start_time >= ?", Time.now - 24.hours)
    @gigs = Gig.all.where(sitter_id: current_sitter.id);
  end

  private

  def sitter_params
      params.require(:sitter).permit(:email, :password)
  end

end
