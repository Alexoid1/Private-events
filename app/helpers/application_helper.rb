module ApplicationHelper
    def error_flashes
        if flash[:notice]
          content_tag(:p, flash[:notice], class: 'alert alert-success')
        elsif flash[:alert]
          content_tag(:p, flash[:alert], class: 'alert alert-danger')
        end
    end
end
