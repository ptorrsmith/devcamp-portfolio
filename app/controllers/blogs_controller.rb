class BlogsController < ApplicationController
  # before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]
  before_action :set_blog, only: [:edit, :update, :destroy, :toggle_status]
  before_action :set_sidebard_topics, except: [:create, :update, :destroy, :toggle_status]
  # layout 'blog'  # only needed if layout file different from controller/route
  # i.e. the layout file is blogs.html.erb in layouts folder, so automatically used
  # but if named blog.html.erb, would need the layout 'blog' declaration above

  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :toggle_status ]}, site_admin: :all
  # examples:
  # access all: [:show, :index], user: {except: [:destroy]}, company_admin: :all
  # # one other option that might seem a bit weird is to put a group of roles in an array:
  # access [:all, :user] => [:show, :index]

  # GET /blogs
  # GET /blogs.json
  def index
    # @blogs = Blog.all
    # @blogs = Blog.limit 2
    # binding.pry
    if logged_in?(:site_admin)
      # @blogs = Blog.page(params[:page]).per(5).order('updated_at DESC')
      @blogs = Blog.page(params[:page]).per(5).recent
    else
      # @blogs = Blog.published.page(params[:page]).per(5).order('updated_at DESC')
      @blogs = Blog.published.recent.page(params[:page]).per(5)
    end
    # binding.pry
    # @blogs = Blog.featured_blogs # for debugging with pry demo ()
    # binding.pry
    # byebug
    # puts "*" * 100
    # puts @blogs.inspect
    # puts "/" * 100
    @page_title = 'Peter Torr Smith - Blogs'
    # binding.pry
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    # only show draft to admins
    @blog = Blog.includes(:comments).friendly.find(params[:id])
    if logged_in?(:site_admin) || @blog.published?
    # set blog sets the current blog
    # however for perf reasons, will override this to bring in comments more effectively
    @page_title = 'Peter Torr Smith - ' + @blog.title
    @seo_keywords = @blog.body  # not good content. create a keywords field on the blog model.

    # need blank new comment for form
    @comment = Comment.new
    else
      redirect_to blogs_path, notice: "You are not authorized to access this page"
    end

  end

  # GET /blogs/new
  def new
    @blog = Blog.new
    @page_title = 'new blog'
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        # notice: is set into flash
        format.html { redirect_to @blog, notice: 'Blog was made gud.', alert: 'blah' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle_status
    # byebug
    if @blog.draft?
      @blog.published!
    else
      @blog.draft!
    end
    redirect_to blogs_url, notice: 'Blog status has been updated'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      # @blog = Blog.find(params[:id])
      @blog = Blog.friendly.find(params[:id])  
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :body, :topic_id, :status)
    end

    # could refactor this and the duplication in the topics controller (method and before action) into a concern
    # though the exceptions are a bit different.
    def set_sidebard_topics
      @sidebar_topics = Topic.with_published_blogs
    end
  
end
