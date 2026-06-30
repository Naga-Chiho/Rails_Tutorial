module Admin
  class ApplicationController < ActionController::Base
    allow_browser versions: :modern
    before_action :require_login
    helper_method :current_user, :logged_in?, :breadcrumbs
 
    def breadcrumbs
      @breadcrumbs ||= []
    end

    def add_breadcrumb(name, path = nil)
      breadcrumbs << Breadcrumb.new(name, path)
    end

    def require_login
      if session[:user_id].nil?
        redirect_to new_admin_session_path
      end
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) 
    end

    def logged_in?
      current_user != nil
    end
    
    layout 'admin/application'
  end
end