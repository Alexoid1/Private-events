class Event < ApplicationRecord
    belongs_to :user
    has_many :invitations, foreign_key: :attended_event_id
    has_many :event_attendees, through: :invitations, source: :event_attendee

    
end
