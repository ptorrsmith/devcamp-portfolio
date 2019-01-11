class PortfolioItemsController < ApplicationController

    before_action :set_portfolio_item, only: [:show, :edit, :update, :destroy]

    def index
        @portfolio_items = PortfolioItem.all
    end

    def new
        @portfolio_item = PortfolioItem.new
    end

    def create
        @portfolio_item = PortfolioItem.new(portfolio_item_params)
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

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_item
      @portfolio_item = PortfolioItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portfolio_item_params
      params.require(:portfolio_item).permit(:title, :subtitle, :body, :main_image, :thumb_image)
    end
end
