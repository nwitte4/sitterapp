class ParentsController < ApplicationController

  def index
    @parent = Parent.find(params[:format])
  end

  def show
    @parent = Parent.find(params[:id])
    @notes = Note.where(parent_id: current_parent.id).order(:sitter_id)
  end

  def update
    if parent_signed_in?
      @parent = current_parent
      @sitter = Sitter.where(email: params[:parent][:q])
    else
      @parent = Parent.find(params[:id])
      @sitter = current_sitter
    end

    @parent.sitters << @sitter

    if Sitter.pluck(:id).include?(@sitter.ids)
      redirect_to '/'
    else
      redirect_to @parent, notice: 'No sitters match this email. Please try again!'
    end
  end

  def remove_sitter_from_parent
    if parent_signed_in?
      parent = current_parent
      sitter = Sitter.find(params[:id])
    else
      parent = Parent.find(params[:id])
      sitter = current_sitter
    end

    if sitter
      parent.sitters.delete(sitter)
      redirect_to '/'
    end

  end

  private

  def parent_params
    params.require(:parent).permit(:email, :password)
  end



end
