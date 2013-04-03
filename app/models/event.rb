class Event < ActiveRecord::Base
  validate :available
  attr_accessible :color, :conference_room_id, :end, :start, :title, :allDay
  belongs_to :ConferenceRoom

  def available
    concurrent_events = Event.find(:all, :conditions => ["start between ? and ? OR end between ? and ?", self.start, self.end, self.start, self.end])
    puts "TESTING\n"
    if concurrent_events.length > 0
      errors.add(:Overlap, "Conference Room is already booked for this time period")
    end

  end
end
