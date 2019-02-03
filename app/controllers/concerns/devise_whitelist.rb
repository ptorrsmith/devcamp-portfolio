#modular code piece
module DeviseWhitelist # must match filename CapCasing > cap_casing.rb
    extend ActiveSupport::Concern

    included do 
        before_action :configure_permitted_parameters, if: :devise_controller?
   end

   # whitelisting allowed form fields in posts, puts, patches etc
        def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end
