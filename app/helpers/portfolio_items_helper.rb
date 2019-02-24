module PortfolioItemsHelper

    def image_generator(height:, width:)
        "http://placehold.it/#{height}x#{width}"

    end

    def portfolio_item_img item, type
        # byebug
        # expects a PortfolioItemUploader object
        # this is a bit wierd, as have to access thumb image up to model, down into value!!?!?!?! 
        # byebug
        if type == 'thumb'
            if item.thumb_image.to_s.length > 0
                item.thumb_image.to_s
            else 
                image_generator(height: '350', width: '200')
            end
        else # 'main'
            if item.main_image.to_s.length > 0
                item.main_image.to_s
            else
                image_generator(height: '600', width: '400')
            end
        end
        # byebug
    end
    
end
