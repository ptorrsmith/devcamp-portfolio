class PagesController < ApplicationController

  def home
    @page_title = 'Peter Torr Smith - home'
    @blogs = Blog.all
    # @skills = Skill.all
  end

  def about
    @page_title = 'Peter Torr Smith - About, Skills, Experience, Qualification, CV'
    # @skills = Skill.where('skill_level > 0').order('skill_level DESC')
    if ENV['SKILL_SORT_BY'] == 'SORT_ORDER' # else 'SKILL_LEVEL'
      @skills = Skill.where('skill_level > 0').order('sort_order, skill_level DESC, title')
    else
      @skills = Skill.where('skill_level > 0').order('skill_level DESC, sort_order, title')
    end
    # @skills = Skill.where('skill_level > 0').order('skill_level DESC, sort_order')
    @roles = Role.order('roles.from DESC')
    @qualificaitons = Qualification.order('year_obtained DESC')
  end

  def contact
    @page_title = 'Peter Torr Smith - contact'
  end

  def tech_news
    @tweets = SocialTool.twitter_search "#rubyonrails -rt"
  end

  def course_completion
    @page_title = 'Peter Torr Smith - Graduation Udemy Rails 5 Professional'
  end
end
