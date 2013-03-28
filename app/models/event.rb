class Event < ActiveRecord::Base
  attr_accessible :color, :conference_room_id, :endsAt, :startsAt, :title
  belongs_to :ConferenceRoom
end
