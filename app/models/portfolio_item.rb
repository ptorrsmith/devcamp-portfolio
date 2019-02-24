class PortfolioItem < ApplicationRecord
    # require 'carrierwave'
    has_many :technologies
    accepts_nested_attributes_for   :technologies, 
    reject_if: lambda { |attrs| attrs['name'].blank? }
    
    # include PlaceholderImage  # concern
    # validates_presence_of :title, :body, :main_image, :thumb_image
    validates_presence_of :title, :body # due to move to carrierwave uploader (and remove image management out of the model, into a helper)
    
    # this says how to manage (interpret) and present the thumb and main image... as a PortfolioItemUploder object.
    mount_uploader :thumb_image, PortfolioItemUploader
    mount_uploader :main_image, PortfolioItemUploader
    
    ################## SCOPES - 2 styles / approaches / options  ############################
    # define scope option 1
    def self.javascript
        where(subtitle: 'Javascript')  # one way
    end

    # define scope option 2 (using the lambda construct)
    scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails')}
    
    ################## END - SCOPES - 2 styles / approaches / options  ############################


    def self.by_position
        # this is called a  "scope", refining the default data set (order, where, etc)
        order('position asc')
    end




    # after_initialize :set_defaults

    # def set_defaults
    #     # not using concerns
    #     # self.main_image ||= 'http://placehold.it/600x400'
    #     # self.thumb_image ||= 'http://placehold.it/350x200'

    #     # using concerns, initially (later moved to portfolio_items_helper.rb)

    #     # set these to portfolio defaults
    #     self.main_image ||= PlaceholderImage.image_generator(height: '600', width: '450')
    #     self.thumb_image ||= PlaceholderImage.image_generator(height: 356, width: 280)
    # end

    # Finally: Move image management out of the model, into a helper that takes into account carrierwave 

end
