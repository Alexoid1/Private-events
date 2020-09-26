module ApplicationHelper
    def error_flashes
        if flash[:notice]
          content_tag(:p, flash[:notice], class: 'alert alert-success')
        elsif flash[:alert]
          content_tag(:p, flash[:alert], class: 'alert alert-danger')
        end
    end

    def current_user
      return unless session[:user_id]
  
      @current_user ||= User.find_by_id(session[:user_id])
    end

    def login_logout
      if login?
        link_to "Sign up",  new_user_path, class:"nav-link text-dark"
      else
        link_to 'Logout', logout_path,
              data: { confimation: 'are you sure?' },
              class: 'nav-link text-dark'
      end  
    end  

    def signin_users
      if login?
        link_to "Sign in",  new_session_path, class:"nav-link text-dark"
      else
        link_to "Users",  users_path, class:"nav-link text-dark"
      end  
    end  
    def login?
      @cuser = User.find_by_id(session[:user_id])
      return @cuser.nil?      
    end 
end
