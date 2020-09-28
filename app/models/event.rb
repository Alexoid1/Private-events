class Event < ApplicationRecord
    belongs_to :user
    has_many :invitations, foreign_key: :attended_event_id
    has_many :event_attendees, through: :invitations, source: :event_attendee
    has_attached_file :image, styles: { medium: "500x300>", thumb: "100x100>" }
   
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
   

end
