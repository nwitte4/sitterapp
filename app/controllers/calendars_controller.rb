class CalendarsController < ApplicationController
  before_action :check_for_users

  def index
    if current_parent
      @parent = current_parent
      @sitters = current_parent.sitters.all
      @gigs = Gig.where(parent_id: current_parent.id)
    else
      @sitter = current_sitter
      @parents = current_sitter.parents.all
      ids = @parents.pluck(:id)
      @gigs = Gig.all.where(parent_id: ids)
    end

  end


private

def parent_params
  params.require(:parent).permit(:email, :sitter_ids)
end

def sitter_params
  params.require(:sitter).permit(:email, :parent_ids)
end

end
