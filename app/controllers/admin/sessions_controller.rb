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
          user = User.find_or_create_by!(email: email) do |u|
          u.name = auth_hash['info']['name'] || 'GitHub User'
          u.password = SecureRandom.hex(10)
          u.furigana = 'ダミー'
          u.birthday = Date.new(2000, 1, 1)
          u.department_id = Department.first&.id || 1 
          u.gender = '男' 
          u.phone = '090-0000-0000'
          u.postal_code = '000-0000'
          u.prefecture = '東京都' 
          u.city = 'ダミー市区町村'
          u.town = 'ダミー町名'
          u.street = 'ダミー番地'
        end
 
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