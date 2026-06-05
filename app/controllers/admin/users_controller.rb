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
      send_data @user.image, type: 'image/jpeg', disposition: 'inline'
    end

    def create
      upload_file = user_params[:upload_file]

      if upload_file[:image] != nil
        upload_file[:image] = upload_file[:image].read
      end

      @user = User.new(user_params)
      
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
      update_file = user_params

      if upload_file[:image] != nil
        update_file[:image] = update_file[:image].read
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