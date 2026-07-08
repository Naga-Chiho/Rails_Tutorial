module Admin
  class ApplicationController < ActionController::Base
    before_action :require_login
    helper_method :current_user, :logged_in?
    rescue_from ActiveRecord::RecordNotFound, :record_not_found

    def require_login
      return unless session[:user_id].nil?

      redirect_to new_admin_session_path
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
      current_user != nil
    end

    private

    def record_not_found
      render file: Rails.root.join('public/404.html'), status: 404, layout: false, content_type: 'text/html'
    end
z
    layout 'admin/application'
  end
end
