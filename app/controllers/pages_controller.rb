class PagesController < ApplicationController

  def home
    @page_title = 'Peter Torr Smith - home'
    @blogs = Blog.all
    # @skills = Skill.all
  end

  def about
    @page_title = 'Peter Torr Smith - about'
    @skills = Skill.where('skill_level > 0')
    @roles = Role.order('roles.from DESC')
    @qualificaitons = Qualification.order('year_obtained DESC')
  end

  def contact
    @page_title = 'Peter Torr Smith - contact'
  end

  def tech_news
    @tweets = SocialTool.twitter_search "#rubyonrails -rt"
  end
end
