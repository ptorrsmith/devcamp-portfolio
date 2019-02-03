module ApplicationHelper

    def sample_helper
        "<p>My Helper</p>".html_safe # needed to parse HTML, else will just be text with tages
        # don't use .html_safe with user input

    end

    def login_helper
        if current_user.is_a?(User)
        link_to "Log out", destroy_user_session_path, method: :delete
      else
        (link_to "Register", new_user_registration_path) + '<br />'.html_safe + (link_to "Log in", new_user_session_path)
      end
    end
end
