module Admin  
    class UsersController < ApplicationController
    before_action :require_login

    def index
      @users = User.all
      @param_name = params[:name]
      @param_prefecture = params[:prefecture]
      @param_birthday = params[:birthday]
      @param_per_page = params[:per_page] 
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

    def new
      @user = User.new
    end

    def show
      @user = User.find(params[:id])
    end

    def show_image
      @user = User.find(params[:id])
      send_data @user.image, type: 'image/jpeg', disposition: 'inline'
    end

    def update
      @user = User.find(params[:id])
      attrs = user_params
      update_file = user_params[:image]

      if update_file != nil
        image_binary = update_file.read
        attrs[:image] = image_binary
      end

      if @user.update(attrs)
        redirect_to [:admin, @user]
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admin_users_path 
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      update_file = user_params[:image]
      update_params = user_params

      if update_file != nil
        image_binary = update_file.read
        update_params[:image] = image_binary
      end

      if @user.update(update_params)
        redirect_to [:admin, @user]
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private
      def user_params
        params.expect(user: [
          :name, 
          :furigana,
          :department_id,
          :gender, 
          :phone, 
          :mobile_phone, 
          :email, 
          :postal_code, 
          :prefecture, 
          :city, 
          :town, 
          :street, 
          :building,
          :image,
          :birthday, 
          skill_ids: []
        ])
      end
  end
end