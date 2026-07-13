module Admin
  class SkillsController < ApplicationController
    def index
      @skills = Skill.all
      @param_name = params[:name]
      @param_per_page = params[:per_page]
      @skills = @skills.page(params[:page]).per(@param_per_page.presence)
    end

    def new
      @skill = Skill.new
    end

    def show
      @skill = Skill.find(params[:id])
    end

    def create
      @skill = Skill.new(skill_params)
      if @skill.save
        redirect_to [:admin, @skill]
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @skill = Skill.find(params[:id])
    end

    def update
      @skill = Skill.find(params[:id])
      if @skill.update(skill_params)
        redirect_to [:admin, @skill]
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @skill = Skill.find(params[:id])
      @skill.destroy
      redirect_to admin_skills_path
    end

    private

    def skill_params
      params.expect(skill: [:name])
    end
  end
end
