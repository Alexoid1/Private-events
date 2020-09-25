class User < ApplicationRecord
    validates :name, :email, presence: true
    validates_uniqueness_of :email
    has_many :invitations, foreign_key: :event_attendee_id
    has_many :attended_events, through: :invitations
    has_many :events
   
end
