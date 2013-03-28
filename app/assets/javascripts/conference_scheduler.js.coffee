window.ConferenceScheduler =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new ConferenceScheduler.Routers.Calendars()
    Backbone.history.start()

$(document).ready ->
  ConferenceScheduler.initialize()
