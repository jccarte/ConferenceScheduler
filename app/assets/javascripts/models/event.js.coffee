class ConferenceScheduler.Models.Event extends Backbone.Model
  initialize: (data, options)->
    console.log(options)
    @collId = options.collId

  url: ->
    return '/conference_rooms/' + @collId + '/events'
