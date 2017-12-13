class ParentsController < ApplicationController

  def update
    @parent = current_parent
    @sitter = Sitter.find(params[:sitter_ids])
    @parent.sitters << @sitter
    if @parent.save
      redirect_to '/'
    else
      flash[:notice] = 'Did not work'
      redirect_to '/'
    end
  end


end
