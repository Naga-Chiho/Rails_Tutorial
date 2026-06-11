class UsersController < ApplicationController

  def index
    @users = User.all

    if params[:name].present?
      @users = User.where("name LIKE ?", params[:name])
    end

    if params[:prefecture].present?
      @users = User.where("prefecture LIKE ?", params[:prefecture])
    end

    if params[:birthday_asc].present?
      @users = User.order(birthday: :ASC)
    end

    if params[:birthday].present?
      @users = User.order(birthday: :DESC)
    end

    @users = @users.page(params[:page]).per(params[:per_page].presence)
  end

  def show
    @user = User.find(params[:id])
  end
end



