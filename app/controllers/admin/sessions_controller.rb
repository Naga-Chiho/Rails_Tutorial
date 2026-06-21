module Admin 
  class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]
    
    def new
    end

    def create
      user = User.find_by(email: params[:email])

      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to admin_users_path, notice: 'ログインしました。'
      else
        flash.now[:alert] = 'メールアドレスまたはパスワードが間違っています。' 
        render :new, status: :unprocessable_entity 
      end
    end

    def destroy
      session.delete(:user_id)
      redirect_to '/admin/login'
    end
  end
end