class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :avatar

  protected

    def avatar
      @avatar = user_signed_in? ? current_user.avatar_url : nil
    end

end
