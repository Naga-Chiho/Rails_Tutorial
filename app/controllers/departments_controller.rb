class DepartmentsController < ApplicationController 
    before_action :set_breadcrumbs
     
    def index
        @departments = Department.all
    end

    def show
        @department = Department.find(params[:id])
        add_breadcrumb(@department.name)
    end

    def set_breadcrumbs
        add_breadcrumb("部署一覧", departments_path)
    end
end