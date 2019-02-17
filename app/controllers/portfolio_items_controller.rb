class PortfolioItemsController < ApplicationController

    
    # before_action :set_portfolio_item, only: [:show, :edit, :update, :destroy]
    before_action :set_portfolio_item, only: [:show, :edit, :update, :destroy]
    # layout 'portfolio_items' # why different ? not needed anymore in rails 5.1/5.2 ?

    # don't seem to need all yet as anon is a GuestUser so is covered by user: Not ideal
    access user: {except: [:destroy, :new, :create, :update, :edit, ]}, site_admin: :all
    #  Why can anon / user see :javascript_items if left off all?
    # access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, ]}, site_admin: :all
    # access all: [:show, :index, :javascript_portfolio_items], user: {except: [:destroy, :new, :create, :update, :edit, ]}, site_admin: :all
    # examples:
    # access all: [:show, :index], user: {except: [:destroy]}, company_admin: :all
    # # one other option that might seem a bit weird is to put a group of roles in an array:
    # access [:all, :user] => [:show, :index]
  

    def index
        # @portfolio_items = PortfolioItem.all
        # # this is called a  "scope", refining the default data set
        # @portfolio_items = PortfolioItem.order('position ASC')
        @portfolio_items = PortfolioItem.by_position
        # binding.pry
    end
    
    def ruby_on_rails_portfolio_items
        @rails_portfolio_items = PortfolioItem.ruby_on_rails_portfolio_items       
    end
    
    def javascript_portfolio_items
        @javascript_portfolio_items = PortfolioItem.javascript
    end

    def new
        @portfolio_item = PortfolioItem.new
        3.times { @portfolio_item.technologies.build }
    end

    def create
        @portfolio_item = PortfolioItem.new(portfolio_item_params)
        # @portfolio_item = PortfolioItem.new(params.require(:portfolio_item).permit(:title, :subtitle, :body, :main_image, :thumb_image, technologies_attributes: [:name]))
        respond_to do |format|
            if @portfolio_item.save
              format.html { redirect_to portfolio_items_path, notice: 'Portfolio Item was made gud mate!' }
            #   format.json { render :show, status: :created, location: @portfolio_item }
            else
              format.html { render :new }
            #   format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
            end
          end
    end

    def show
# binding.pry
    end

    def edit
        # 3.times { @portfolio_item.technologies.build }

    
    end

    def destroy
        @portfolio_item.destroy
        respond_to do |format|
        format.html { redirect_to portfolio_items_url, notice: "Portfolio Item #{@portfolio_item.id} was successfully destroyed." }
        format.json { head :no_content }
    end
    
    end

    def update
        respond_to do |format|
            if @portfolio_item.update(portfolio_item_params)
                format.html { redirect_to portfolio_items_path, notice: 'Portfolio Item was updated gud buddy!' }
            #   format.json { render :show, status: :created, location: @portfolio_item }
            else
              format.html { render :new }
            #   format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
            end
          end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_item
      @portfolio_item = PortfolioItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portfolio_item_params
        # this is called Strong Params
        # params.require(:portfolio_item).permit(:title, :subtitle, :body, technologies_attributes: [:name], :main_image, :thumb_image)
        # NOTE: nested attributes expected at end of params list, not middle (as above which fails)
        params.require(:portfolio_item).permit(
            :title, 
            :subtitle, 
            :body, 
            :main_image, 
            :thumb_image, 
            technologies_attributes: [:name]
            )
    end
end
