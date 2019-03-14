class AddUrlToPortfolioItems < ActiveRecord::Migration[5.2]
  def change
    add_column :portfolio_items, :url, :string
  end
end
