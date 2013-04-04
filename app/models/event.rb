class Event < ActiveRecord::Base
  validate :available
  attr_accessible :color, :conference_room_id, :end, :start, :title, :allDay
  belongs_to :ConferenceRoom

  def available
    concurrent_events = Event.find(:all, :conditions => ["conference_room_id = ? AND (start between ? and ? OR \"end\" between ? and ?)", self.conference_room_id, self.start, self.end, self.start, self.end])
    if concurrent_events.length > 0
      puts "Validation Failed"
      errors.add(:Overlap, "Conference Room is already booked for this time period")
    end

  end
end
