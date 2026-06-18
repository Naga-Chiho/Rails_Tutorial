module Admin    
    class DepartmentsController < ApplicationController

        def index
            @departments = Department.all
        end

        def new
            @department = Department.new
        end

        def show
            @department = Department.find(params[:id])
        end

        def create
            @department = Department.new(department_params)
            if @department.save
                redirect_to [:admin, @department]
            else
                render :new, status: :unprocessable_entity
            end
        end

        def edit
            @department = Department.find(params[:id])
        end

        def update
            @department = Department.find(params[:id])
            if @department.update(department_params) 
            redirect_to [:admin, @department]
            else
                render :edit, status: :unprocessable_entity
            end
        end

        def destroy
            @department = Department.find(params[:id])
            @department.destroy
            redirect_to admin_departments_path
        end

        private
    
        def department_params
        params.expect(department: [:name])
        end
    end
end