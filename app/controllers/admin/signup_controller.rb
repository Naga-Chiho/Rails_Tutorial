module Admin
  class SignupController < ApplicationController
    skip_before_action :require_login, only: %i[new create]

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to admin_users_path, notice: "ユーザー登録が完了しました！"
      else
        render :new, status: :unprocessable_entity
      end
    end

    private

    def user_params
    params.require(:user).permit(
        :name, :furigana, :gender, :phone, :email, :postal_code, 
        :prefecture, :city, :town, :street, :building, :birthday, 
        :department_id, skill_ids: [] 
    )
    end
  end
end