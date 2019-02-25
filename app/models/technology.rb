class Technology < ApplicationRecord
  belongs_to :portfolio_item # , inverse_of: :technologies

  validates_presence_of :name
end
