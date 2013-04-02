class ConferenceScheduler.Models.Event extends Backbone.Model
  initialize: (data, options)->
    @collId = options.collId

  url: ->
    return '/conference_rooms/' + @collId + '/events'
