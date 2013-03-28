class Event < ActiveRecord::Base
  attr_accessible :color, :conference_room_id, :ends_at, :starts_at, :title
  belongs_to :ConferenceRoom
end
