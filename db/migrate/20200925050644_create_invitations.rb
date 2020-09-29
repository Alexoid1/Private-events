class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      
      t.integer :event_attendee_id
      t.integer :attended_event_id

      t.timestamps
    end
    add_index :invitations, :event_attendee_id
    add_index :invitations, :attended_event_id
  end
end
