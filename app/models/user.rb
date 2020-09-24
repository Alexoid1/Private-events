class User < ApplicationRecord
    validates :name, :email, presence: true
    validates_uniqueness_of :email
   
   
    has_many :my_events, class_name: 'Event'
    def current_user
        return unless session[:user_id]
    
        @current_user ||= User.find_by_id(session[:user_id])
    end
end
