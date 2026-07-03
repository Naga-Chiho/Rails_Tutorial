# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
    @users = User.includes(:department)
    @param_name = params[:name]
    @param_prefecture = params[:prefecture]
    @param_birthday = params[:birthday]
    @param_per_page = params[:per_page]
    @user_prefectures = User.prefectures.keys

    @users = @users.search_name(@param_name) if @param_name.present?

    @users = @users.search_prefecture(@param_prefecture) if @param_prefecture.present?

    if @param_birthday == 'asc'
      @users = @users.order(birthday: :asc)
    elsif @param_birthday == 'desc'
      @users = @users.order(birthday: :desc)
    end

    @users = @users.page(@param_per_page).per(@param_per_page.presence)
  end

  def show
    @user = User.find(params[:id])
  end
end
