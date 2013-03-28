class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :startsAt
      t.datetime :endsAt
      t.string :title
      t.string :color
      t.integer :conference_room_id

      t.timestamps
    end
  end
end
