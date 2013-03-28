class ConferenceScheduler.Views.CalendarsIndex extends Backbone.View

  template: JST['calendars/index']

  events:
    'submit #search': 'searchRooms'

  initialize: ->
    @collection.on('sync', @render, this)
    @results = ''

  render: ->
    $(@el).html(@template(rooms: @results))
    this

  searchRooms: (event)->
    event.preventDefault()
    @results = @collection.where({building: $("#searchfield").val()})

    #alert(JSON.stringify(@results))
    $(@el).html(@template(rooms: @results))
