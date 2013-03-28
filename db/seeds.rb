# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
room1 = ConferenceRoom.create(capacity: 12, building: '3112', name: 'C2E Lab Room', vtc: false)
room1.Events.create(title: "test event", starts_at: "2013-03-28 12:33:16", ends_at: "2013-03-30 12:33:16")