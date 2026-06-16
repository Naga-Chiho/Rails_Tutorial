class UsersController < ApplicationController

  def index
    @users = User.all
    @param_name = params[:name]
    @param_prefecture = params[:prefecture]
    @param_birthday = params[:birthday]
    @param_per_page = params[:per_page] 
    @user_prefectures = User.prefectures.keys

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

    @users = @users.page(@param_per_page ).per(@param_per_page.presence)
  end

  def show
    @user = User.find(params[:id])
  end
end



