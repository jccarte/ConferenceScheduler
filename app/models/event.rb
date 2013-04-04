class Event < ActiveRecord::Base
  validate :available
  attr_accessible :color, :conference_room_id, :endAt, :start, :title, :allDay
  belongs_to :ConferenceRoom

  def available
    concurrent_events = Event.find(:all, :conditions => ["conference_room_id = ? AND (start between ? and ? OR endAt between ? and ?)", self.conference_room_id, self.start, self.endAt, self.start, self.endAt])
    if concurrent_events.length > 0
      puts "Validation Failed"
      errors.add(:Overlap, "Conference Room is already booked for this time period")
    end

  end
end
