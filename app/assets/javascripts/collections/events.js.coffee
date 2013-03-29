class ConferenceScheduler.Collections.Events extends Backbone.Collection
  initialize: (models, options)->
    @id = options.id

  url: ->
    return '/conference_rooms/' + @id

  getId: ->
    @id
  model: ConferenceScheduler.Models.Event
