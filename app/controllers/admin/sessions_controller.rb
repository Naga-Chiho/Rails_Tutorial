module Admin 
  class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:new, :create, :omniauth]
    
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

    def omniauth
      auth_hash = request.env['omniauth.auth']
      email = auth_hash['info']['email']

       if email.present? && email.end_with?('@rizapgroup.com')
        reset_session 

        session[:user_id] = user.id
        redirect_to admin_users_path
      else
        render :new
      end
    end

    def destroy
      session.delete(:user_id)
      redirect_to new_admin_session_path
    end
  end
end