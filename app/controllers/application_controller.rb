class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def check_for_users
    if !parent_signed_in? && !sitter_signed_in?
      authenticate_parent!
    end
  end
end
