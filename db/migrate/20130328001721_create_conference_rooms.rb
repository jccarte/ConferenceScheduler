class CreateConferenceRooms < ActiveRecord::Migration
  def change
    create_table :conference_rooms do |t|
      t.integer :capacity
      t.string :building
      t.boolean :vtc
      t.string :name

      t.timestamps
    end
  end
end
