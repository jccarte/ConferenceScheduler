class ConferenceScheduler.Collections.Events extends Backbone.Collection
  initialize: (models, options)->
    this.id = options.id

  url: ->
    return '/conference_rooms/' + this.id

  model: ConferenceScheduler.Models.Event