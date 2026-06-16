module Admin
  class ApplicationController < ActionController::Base

    def require_login
      if session[:user_id].nil?
        redirect_to '/admin/login'
      end
    end
    
    layout 'admin/application'
  end
end