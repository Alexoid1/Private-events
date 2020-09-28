module EventsHelper

    def image_event(event)
        if event.image.exists?
           image_tag event.image.url (:medium)
        else
        end        

    end    

    
    def created_by(event)
        @users.find_by_id(event.user_id).name
    end 
    
    
    

end
