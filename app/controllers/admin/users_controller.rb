module Admin  
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

      if @param_birthday == "asc"
        @users = @users.order(birthday: :asc)
      elsif @param_birthday == "desc"
        @users = @users.order(birthday: :desc)
      end

      @users = @users.page(params[:page]).per(@param_per_page.presence)
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

  def create
    attrs = user_params

    if attrs[:image].present?
      attrs[:image] = attrs[:image].read
    end

    @user = User.new(attrs)
    
    if @user.save
      redirect_to [:admin, @user]
    else
      render :new, status: :unprocessable_entity
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
      attrs = user_params

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