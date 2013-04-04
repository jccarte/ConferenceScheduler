# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
room1 = ConferenceRoom.create(capacity: 12, building: '3112', name: 'C2E Lab Room', vtc: true)
room1.Events.create(title: "test event", start: "2013-03-28 12:33:16", end: "2013-03-30 12:33:16", allDay: true)
room1.Events.create(title: "VTC", start: "2013-04-20 12:33:16", end: "2013-04-21 12:33:16", allDay: true)
room2 = ConferenceRoom.create(capacity: 100, building: '3112', name: 'Quad A', vtc: true)
room2.Events.create(title: "Training!", start: "2013-03-28 12:33:16", end: "2013-03-30 12:33:16", allDay: true)
room3 = ConferenceRoom.create(capacity: 100, building: '3112', name: 'Quad B', vtc: false)
room3.Events.create(title: "All Hands", start: "2013-03-28 12:33:16", end: "2013-03-30 12:33:16", allDay: true)
room4 = ConferenceRoom.create(capacity: 100, building: '3112', name: 'Quad C', vtc: false)