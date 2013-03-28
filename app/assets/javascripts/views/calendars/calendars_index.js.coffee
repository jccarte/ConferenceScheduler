class ConferenceScheduler.Views.CalendarsIndex extends Backbone.View

  template: JST['calendars/index']

  events:
    'submit #search': 'searchRooms'

  initialize: ->
    @collection.on('sync', @render, this)

  render: ->
    $(@el).html(@template(rooms: @collection))
    this

  searchRooms: (event)->
    event.preventDefault()
    alert "you searched!"
