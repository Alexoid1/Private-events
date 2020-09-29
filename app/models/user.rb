class User < ApplicationRecord
  validates :name, :email, presence: true
  validates_uniqueness_of :email
  has_many :invitations, foreign_key: :event_attendee_id
  has_many :attended_events, through: :invitations
  has_many :events

  has_attached_file :image, styles: { medium: '180x180>', thumb: '100x100>' }
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png']
  scope :previous, -> { where(['time <= ?', Date.today]) }
  scope :upcoming, -> { where(['time > ?', Date.today]) }
end
