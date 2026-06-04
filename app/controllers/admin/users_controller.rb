module Admin  
  class UsersController < AdminController
    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def show
      @user = User.find(params[:id])
    end

    def create
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
          :address1, 
          :address2, 
          :address3, 
          :address4, 
          :address5, 
          :birthday,
          skill_ids:[],
        ])
      end
  end
end