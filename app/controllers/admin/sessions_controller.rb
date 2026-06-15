# app/controllers/admin/sessions_controller.rb
class Admin::SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user
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