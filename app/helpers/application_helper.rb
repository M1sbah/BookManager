module ApplicationHelper
    def navigation_link
        if user_signed_in?
            content_tag(:li , (link_to "Logout", destroy_user_session_path, method: :delete ,class:"nav-link") , class:"nav-item") +
            content_tag(:li , (link_to "Profile", edit_user_registration_path, class:"nav-link") , class:"nav-item")
        else
          content_tag(:li , (link_to "Login", new_user_session_path, class:"nav-link") , class:"nav-item")
        end
    end
end
