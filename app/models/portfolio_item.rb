class PortfolioItem < ApplicationRecord
    validates_presence_of :title, :body, :main_image, :thumb_image

    # define scope option 1
    def self.javascript
        where(subtitle: 'Javascript')  # one way
    end

    # define scope option 2
    scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails')}

    after_initialize :set_defaults

    def set_defaults
        self.main_image ||= 'http://placehold.it/600x400'
        self.thumb_image ||= 'http://placehold.it/350x200'
    end

end
