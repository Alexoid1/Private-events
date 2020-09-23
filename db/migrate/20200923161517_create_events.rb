class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.text :title
      t.text :description
      t.string :location
      t.string :time

      t.timestamps
    end
  end
end
