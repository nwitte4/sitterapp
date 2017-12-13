class CalendarsController < ApplicationController
  before_action :check_for_users

  def index
    @parent = current_parent
    @sitters = current_parent.sitters.all
  end


private

def parent_params
  params.require(:parent).permit(:email, :sitter_ids)
end

def sitter_params
  params.require(:sitter).permit(:email, :parent_ids)
end

end
