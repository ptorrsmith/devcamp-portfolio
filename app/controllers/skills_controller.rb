class SkillsController < ApplicationController
  before_action :set_skill, only: [:show, :edit, :update, :destroy]
  access site_admin: :all

  # GET /skills
  def index
    if ENV['SKILL_SORT_ORDER'] == 'SORT_ORDER' # 'SKILL_LEVEL'
      @skills = Skill.all.order('sort_order, skill_level DESC')
    else
      @skills = Skill.all.order('skill_level DESC, sort_order ASC')
    end
  end

  # GET /skills/1
  def show
  end

  # GET /skills/new
  def new
    @skill = Skill.new
  end

  # GET /skills/1/edit
  def edit
  end

  # POST /skills
  def create
    @skill = Skill.new(skill_params)

    if @skill.save
      redirect_to @skill, notice: 'Skill was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /skills/1
  def update
    if @skill.update(skill_params)
      # redirect_to @skill, notice: 'Skill was successfully updated.'
      redirect_to skills_path, notice: "Skill '#{@skill.title}' (#{@skill.id}) was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /skills/1
  def destroy
    @skill.destroy
    redirect_to skills_url, notice: 'Skill was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill
      @skill = Skill.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def skill_params
      params.require(:skill).permit(:title, :percent_utilized, :skill_level, :sort_order)
    end
end
