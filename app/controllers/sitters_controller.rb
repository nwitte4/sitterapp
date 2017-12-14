class SittersController < ApplicationController

  def index
    @sitter = Sitter.find(params[:format])
  end

  def show
    @sitter = Sitter.find(params[:id])
  end

  private

  def sitter_params
      params.require(:sitter).permit(:email, :password)
  end

end
