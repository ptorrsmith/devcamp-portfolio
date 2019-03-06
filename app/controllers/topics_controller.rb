class TopicsController < ApplicationController
  
  before_action :set_sidebard_topics

  layout 'blogs'

  def index
    @topics = Topic.all.order('title')
  end

  def show
    @topic = Topic.find(params[:id])
    # @topic.blogs

    if logged_in?(:site_admin)
      # @blogs = Blog.page(params[:page]).per(5).order('updated_at DESC')
      @blogs = @topic.blogs.recent.page(params[:page]).per(5)
    else
      # @blogs = Blog.published.page(params[:page]).per(5).order('updated_at DESC')
      @blogs = @topic.blogs.published.page(params[:page]).per(5).recent
    end
    # binding.pry
    # @blogs = Blog.featured_blogs # for debugging with pry demo ()
    # binding.pry
    # byebug
    # puts "*" * 100
    # puts @blogs.inspect
    # puts "/" * 100
    @page_title = 'Peter Torr Smith - #{@topic.title} Blogs'

  end

  private

  def topics_params
    # todo
  end

  def set_sidebard_topics
    @sidebar_topics = Topic.with_published_blogs
  end

end
