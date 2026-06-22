module Admin 
  class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]
    
    def new
    end

    def create
      user = User.find_by(email: params[:email])

      if user && user.authenticate(params[:password])
        reset_session 
        
        session[:user_id] = user.id
        redirect_to admin_users_path
      else
        render :new
      end
    end

    def destroy
      session.delete(:user_id)
      redirect_to '/admin/login'
    end
  end
end