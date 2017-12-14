class ParentsController < ApplicationController

  def index
    @parent = Parent.find(params[:format])
  end

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

  def remove_sitter_from_parent
    parent = current_parent
    sitter = Sitter.find(params[:id])

    if sitter
      parent.sitters.delete(sitter)
      redirect_to '/'
    end

  end


end
