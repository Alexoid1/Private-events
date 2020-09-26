module EventsHelper

   
    
    def created_by(event)
        @users.find_by_id(event.user_id)
    end    
    
    

end
