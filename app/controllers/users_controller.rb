class UsersController < ApplicationController

  def index
    @users = User.all
    @user_prefecture = User.prefectures.keys

    if params[:name].present?
      @users = @users.search_name(params[:name])
    end

    if params[:prefecture].present?
      @users = @users.search_prefecture(params[:prefecture])
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



