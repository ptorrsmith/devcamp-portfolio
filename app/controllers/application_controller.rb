class ApplicationController < ActionController::Base
    

    # move thigns to module conern
    # so modules have single responsibility
    include DeviseWhitelist
    include SetSource
    include CurrentUserConcern


       
    # noticed protect_from_forgery appears to be in Base, so no longer declared here

    # MOVED TO CONCERN MODULE
    # before_action :configure_permitted_parameters, if: :devise_controller?
    # # whitelisting allowed form fields in posts, puts, patches etc
    #     def configure_permitted_parameters
    #     devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    #     devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    # end

    # MOVED TO CONCERN MODULE
    # # do before every 
    # before_action :set_source
    
    # # capture source if linked from other site
    # def set_source
    #     session[:source] = params[:q] if params[:q]    
    # end

    
    
    # MOVED TO CONCERN MODULE
    # override / overload the current user from devise
    # so never return null/nil if no logged in user (e.g guest / anon)
    
    # def current_user
    #     super || OpenStruct.new(name: "Guest visitor", first_names: "Guesty", last_name: "visitori", email: "x@y.z")
    # end


end
