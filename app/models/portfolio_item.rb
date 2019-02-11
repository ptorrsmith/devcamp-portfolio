class PortfolioItem < ApplicationRecord
    has_many :technologies
    accepts_nested_attributes_for   :technologies, 
                                    reject_if: lambda { |attrs| attrs['name'].blank? }

    include PlaceholderImage  # concern
    validates_presence_of :title, :body, :main_image, :thumb_image

    # define scope option 1
    def self.javascript
        where(subtitle: 'Javascript')  # one way
    end

    # define scope option 2 (using the lambda construct)
    scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails')}

    after_initialize :set_defaults

    def set_defaults
        # not using concerns
        # self.main_image ||= 'http://placehold.it/600x400'
        # self.thumb_image ||= 'http://placehold.it/350x200'

        # using concerns
        self.main_image ||= PlaceholderImage.image_generator(height: '600', width: '450')
        self.thumb_image ||= PlaceholderImage.image_generator(height: 356, width: 280)
    end

end
