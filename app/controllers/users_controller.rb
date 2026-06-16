class UsersController < ApplicationController
  def index
    @users = User.all
    @param_name = params[:name]
    @param_prefecture = params[:prefecture]
    @param_birthday = params[:birthday]
    @user_prefecture = User.prefectures.keys

    if @param_name.present?
      @users = @users.search_name(@param_name)
    end

    if @param_prefecture.present?
      @users = @users.search_prefecture(@param_prefecture)
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



