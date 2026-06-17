module Admin
  class ApplicationController < ActionController::Base
    before_action :require_login
    helper_method :current_user, :logged_in?

    def require_login
      if session[:user_id].nil?
        redirect_to '/admin/login'
      end
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
      current_user != nil
    end
    
    layout 'admin/application'
  end
end