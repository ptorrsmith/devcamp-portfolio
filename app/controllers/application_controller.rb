class ApplicationController < ActionController::Base

    # noticed protect_from_forgery appears to be in Base, so no longer declared here

    # Moved to application concern module devise_whitelist.rb
    # before_action :configure_permitted_parameters, if: :devise_controller?


    # # whitelisting allowed form fields in posts, puts, patches etc
    #     def configure_permitted_parameters
    #     devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    #     devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    # end

    include DeviseWhitelist


end
