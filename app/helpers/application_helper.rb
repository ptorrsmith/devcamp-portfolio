module ApplicationHelper

    def sample_helper
        "<p>My Helper</p>".html_safe # needed to parse HTML, else will just be text with tages
        # don't use .html_safe with user input

    end

    def content_tag_helper
        content_tag :div, "my content", class: "my-class"
    end

    def login_helper style = ''
        # this is a temp hack as GuestUser inherits from User
        if current_user.is_a?(GuestUser)
            (link_to "Register", new_user_registration_path, class: style) + 
            ' '.html_safe + 
            (link_to "Log in", new_user_session_path, class: style)
        else
            link_to "Log out", destroy_user_session_path, method: :delete, class: style
        end
    end


    # TODO Layout name???
    def source_helper(layout_name = 'application')
        if session[:source]
            greeting = "Thanks, you came from #{session[:source]}, and you are on the #{layout_name} layout"
            content_tag(:p, greeting, class: "source-greeting")
        end
    end 

    def copyright_generator
        PtsDevcampViewTool::Renderer.copyright 'Peter Torr Smith', 'Have a great day :-)'
    end

    def alerts
        alert = (flash[:alert] || flash[:error] || flash[:notice])

        if alert
            # js add_gritter(alert, title: "Hey you...", sticky: false)
            alert_generator alert
        end
    end

    def alert_generator msg
        js add_gritter(msg, title: "Hey you...", sticky: false)
    end





end
