class CreateEventsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :events_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
    end
  end
end
