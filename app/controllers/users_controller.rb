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

  def create
    @user = User.new(user_params)
    @department.departments.where(department_params).first_or_create
    redirect_to @department
    
    if @user.save
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      puts @user.errors.full_messages
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def user_params

      params.expect(user: [ 
        :name, 
        :furigana, 
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
        :birthday 
      ])
    end

    def set_department
      @department = Department.find(params[:department_id])
    end

    def user_params
      params.expect(user: [ :name ])
    end

end



