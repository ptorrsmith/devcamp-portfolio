module ApplicationHelper

    def sample_helper
        "<p>My Helper</p>".html_safe # needed to parse HTML, else will just be text with tages
        # don't use .html_safe with user input

    end

    def content_tag_helper
        content_tag :div, "my content", class: "my-class"
    end

    def login_helper style = '', tag='span'
        # this is a temp hack as GuestUser inherits from User
        if current_user.is_a?(GuestUser)
login_links = <<LINK
<#{tag}>#{link_to "Register", new_user_registration_path, class: "#{style} #{nav_link_active? new_user_registration_path}"}</#{tag}>
<#{tag}>#{link_to "Log in", new_user_session_path, class: "#{style} #{nav_link_active? new_user_session_path}"}</#{tag}>
LINK
        else
            login_links = "<#{tag}>" +
                (link_to "Log out", destroy_user_session_path, method: :delete, class: style) +
                "</#{tag}>"
        end

        login_links.html_safe
    end


    # TODO Layout name???
    # def source_helper(layout_name = 'application')
    def source_helper(styles="", link_style="")
        if session[:source]
            greeting = "Thanks, you came from #{session[:source]}, please feel free to #{link_to "contact me", contact_path, class: link_style} if you'd like to work together."
            # content_tag(:p, greeting, class: "source-greeting")
            session.delete(:source) # because it get's very annoying to see the banner all the time.  Could've persisted this to a db as well.
            content_tag(:div, greeting.html_safe, class: styles)
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

        # if flash[:alert] || flash[:error] || flash[:notice]
        #     # byebug
        # end


        # if flash[:alert]
        #     alert_generator flash[:alert]
        # end

        # if flash[:error]
        #    alert_generator flash[:error]
        # end
        # if flash[:notice]
        #     alert_generator flash[:notice]
        # end
    end

    def alert_generator msg
        js add_gritter(msg, title: "Hey you...", sticky: false)
    end


    def nav_items # for our nav_helper below
        [
            {
                title: 'Home',
                path: root_path
            },
            {
                title: 'About',
                path: about_me_path
            },
            {
                title: 'Contact',
                path: contact_path
            },
            {
                title: 'Rails News',
                path: tech_news_path
            },
            {
                title: 'Portfolio',
                path: portfolio_items_path
            },
            {
                title: 'Blogs',
                path: blogs_path
            },
            
        ]
    end

    # rebuild of nav_helper to make it driven by the above nav_items array of hashes
    def nav_helper style, tag_type='span'
        nav = ''
        nav_items.each do | item |
            nav << "<#{tag_type}><a href='#{item[:path]}' class='#{style} #{nav_link_active? item[:path]}'>#{item[:title]}</a></#{tag_type}>"
        end

        nav.html_safe
    end

    
    def nav_link_active? path
        
        # binding.pry
        
        "active" if current_page? path
    end

    # first approach for nav_helper, using the 'heredoc' approach
    def nav_helper_heredoc_approach_not_used_anymore style, tag_type='span'
        # this is a "here/hear doc"... to allow multi-line strings to be generated
        # <<NAV   NAV are like giant double quotes
        # so string interpolation and normal double quotes are allowed
        # Contents must be butted to very left
nav = <<NAV        
<#{tag_type}><a href="#{root_path}" class="#{style} #{nav_link_active? root_path}">Home</a></#{tag_type}>
<#{tag_type}><a href="#{about_me_path}" class="#{style} #{nav_link_active? about_me_path}">About</a></#{tag_type}>
<#{tag_type}><a href="#{contact_path}" class="#{style} #{nav_link_active? contact_path}">Contact</a></#{tag_type}>
<#{tag_type}><a href="#{portfolio_items_path}" class="#{style} #{nav_link_active? portfolio_items_path}">Portfolio</a></#{tag_type}>
<#{tag_type}><a href="#{blogs_path}" class="#{style} #{nav_link_active? blogs_path}">Blogs</a></#{tag_type}>
NAV

        nav.html_safe
    end    



end
