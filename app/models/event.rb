class Event < ActiveRecord::Base
  attr_accessible :color, :conference_room_id, :end, :start, :title
  belongs_to :ConferenceRoom
end
