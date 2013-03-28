class ConferenceRoom < ActiveRecord::Base
  attr_accessible :building, :capacity, :name, :vtc
  has_many :Events
end
