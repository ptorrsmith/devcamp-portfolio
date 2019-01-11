class PortfolioItemsController < ApplicationController
    def index
        @portfolio_items = PortfolioItem.all
    end
end
