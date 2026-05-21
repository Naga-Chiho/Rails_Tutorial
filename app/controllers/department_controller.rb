class DepartmentsController < ApplicationController
    before_action :set_department
    
    def index
        @departments = Department.all
    end

    def new
        @department = Department.new
    end

    def create
        @department = Department.new(department_params)

        if @department.save
            redirect_to @department
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @department = Department.find(params[:id])
    end

    def update
        if @department.update(department_params) 
            redirect_to @department 
        else
            puts @department.errors.full_messages
            render :edit, status: :unprocessable_entity
        end
    end

    private
   
    def set_department
        @department = Department.find(params[:id])
    end

    # 追加: 部署用のStrong Parameters
    def department_params
        params.require(:department).permit(:name)
    end
end