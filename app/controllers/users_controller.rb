class UsersController < ApplicationController

  def index
    @users = User.all

    if params[:name] != nil
      @users = User.where("name LIKE ?", params[:name])
    end

    if params[:prefecture] != nil
      @users = User.where("prefecture LIKE ?", params[:prefecture])
    end

    if params[:birthday_asc] != nil
      @users = User.order(birthday: :ASC)
    end

    if params[:birthday] != nil
      @users = User.order(birthday: :DESC)
    end

    @users = @users.page(params[:page]).per(params[:per_page].presence)
  end

  def show
    @user = User.find(params[:id])
  end
end



