class PagesController < ApplicationController
  def home
    @page_title = 'Peter Torr Smith - home'
    @blogs = Blog.all
    @skills = Skill.all
  end

  def about
    @page_title = 'Peter Torr Smith - about'
  end

  def contact
    @page_title = 'Peter Torr Smith - contact'
  end
end
