module UsersHelper
    def image_user(user)
        if user.image.exists?
           image_tag user.image.url (:medium)
        else
            image_tag("user.png", class: "profile-container")
        end        

    end  
end
