class User < ApplicationRecord
    validates :name, :email, presence: true
    validates_uniqueness_of :email
   
   
    has_many :events
   
end
