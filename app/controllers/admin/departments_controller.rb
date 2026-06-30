module Admin    

    class DepartmentsController < ApplicationController
        before_action :set_breadcrumbs

        def index
            @departments = Department.all
        end

        def new
            @department = Department.new
        end

        def show
            @department = Department.find(params[:id])
            add_breadcrumb(@department.name)
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
                add_breadcrumb(@department.name)
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

        def set_breadcrumbs
            add_breadcrumb("部署一覧", departments_path)
        end

        private
    
        def department_params
        params.expect(department: [:name])
        end
    end
end