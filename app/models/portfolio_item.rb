class PortfolioItem < ApplicationRecord
    validates_presence_of :title, :body, :main_image, :thumb_image

    # define scope option 1
    def self.javascript
        where(subtitle: 'Javascript')  # one way
    end

    # define scope option 2
    scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails')}
end
