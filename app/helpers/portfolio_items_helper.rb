module PortfolioItemsHelper

    def image_generator(height:, width:)
        "http://placehold.it/#{height}x#{width}"

    end

    def portfolio_item_img item, type
        # byebug
        # expects a PortfolioItemUploader object (carrierwave)
        # this is a bit wierd, as have to access thumb image up to model, down into value!!?!?!?! 
        # byebug
        if type == 'thumb'
            # byebug
            item.thumb_image.url || image_generator(height: '350', width: '200')
        else # 'main'
            item.main_image.url || image_generator(height: '600', width: '400')
        end
        # byebug
    end
    
end
