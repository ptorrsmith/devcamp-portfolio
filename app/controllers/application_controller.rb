class ApplicationController < ActionController::Base
    

    # move thigns to module conern
    # so modules have single responsibility
    include DeviseWhitelist
    include SetSource
    
    # noticed protect_from_forgery appears to be in Base, so no longer declared here

    # Moved to application concern module devise_whitelist.rb
    # before_action :configure_permitted_parameters, if: :devise_controller?


    # # whitelisting allowed form fields in posts, puts, patches etc
    #     def configure_permitted_parameters
    #     devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    #     devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    # end

    # moved to application concern moule SetSource
    # # do before every 
    # before_action :set_source

    
    # # capture source if linked from other site
    # def set_source
    #     session[:source] = params[:q] if params[:q]    
    # end


end
