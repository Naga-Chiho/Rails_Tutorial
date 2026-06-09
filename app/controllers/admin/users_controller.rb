module Admin  
  class UsersController < ApplicationController
    def index
      @users = User.all
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
      upload_file = user_params[:image]

      if upload_file != nil
        upload_file = upload_file.read
      end

      @user = User.new(upload_file)
      
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
      update_file = user_params[:image]

      if update_file != nil
        image_binary = update_file.read
        update_params[:image] = image_binary
      end

      @user = User.find(params[:id])

      if @user.update(user_params)
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