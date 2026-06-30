class SkillsController < ApplicationController  
    before_action :set_breadcrumbs
    
    def index
        @skills = Skill.all
    end

    def show
        @skill = Skill.find(params[:id])
        add_breadcrumb(@skill.name)
    end

    def set_breadcrumbs
        add_breadcrumb("スキル一覧", skills_path)
    end
end