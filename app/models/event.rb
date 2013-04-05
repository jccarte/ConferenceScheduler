class Event < ActiveRecord::Base
  validate :available
  attr_accessible :color, :conference_room_id, :end, :start, :title, :allDay
  belongs_to :ConferenceRoom

  def available
    all = Event.find_all_by_conference_room_id(self.conference_room_id)
    all.each do | match |
      next if ((match.end <= self.start) or (self.end <= match.start))
      errors.add(:Overlap, "Conference Room is already booked for this time period")
      break
    end
  end
end
