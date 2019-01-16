class Technology < ApplicationRecord
  belongs_to :portfolio_item

  validates_presence_of :name
end
