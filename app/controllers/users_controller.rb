class UsersController < ApplicationController

  def index
    @users = User.all

    if params[:name].present?
      @users = @users.where("name LIKE ?","%#{params[:name]}%")
    end

    if params[:prefecture].present?
      @users = @users.where("prefecture LIKE ?", params[:prefecture])
    end

    if params[:birthday] == "asc"
      @users = @users.order(birthday: :asc)
    elsif params[:birthday] == "desc"
      @users = @users.order(birthday: :desc)
    end

    @users = @users.page(params[:page]).per(params[:per_page].presence)
  end

  def show
    @user = User.find(params[:id])
  end
end



