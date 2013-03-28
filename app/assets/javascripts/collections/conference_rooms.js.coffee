class ConferenceScheduler.Collections.ConferenceRooms extends Backbone.Collection
  initialize: (models, options)->


  url: ->
    return '/conference_rooms'

  model: ConferenceScheduler.Models.ConferenceRoom
