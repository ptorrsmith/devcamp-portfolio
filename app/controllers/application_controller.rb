class ApplicationController < ActionController::Base
    

    # move thigns to module conern
    # so modules have single responsibility
    include DeviseWhitelist
    include SetSource
    include CurrentUserConcern
    include DefaultPageContentConcern

    
    # move to application helper once built gem and tested
    # before_action :set_copyright

    # def set_copyright
    #     @copyright = PtsDevcampViewTool::Renderer.copyright 'Peter Torr Smith', 'Have a great day :-)'
    # end

# byebug

    ############ Rails 5.1 / 5.2 changes ############################################

    # noticed protect_from_forgery appears to be in Base, so no longer declared here
    
    #################################################################################



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

# replaced by self-built gem PtsDevampViewTool 
# module DevCampViewTool
#     class Renderer
#         def self.copyright name, msg
#             "&copy; #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
#         end
#     end

# end

