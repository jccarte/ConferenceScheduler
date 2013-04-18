class ConferenceScheduler.Views.CalendarsIndex extends Backbone.View

  template: JST['calendars/index']

  events:
    'submit #search': 'searchRooms'
    'click .room_link': 'drawCalendar'

  initialize: ->
    @collection.on('sync', @render, this)

  render: ->
    $(@el).html(@template(rooms: @collection.models))
    this

  searchRooms: (event)->
    event.preventDefault()
    @results = @collection.where({building: $("#searchfield").val()})

    #alert(JSON.stringify(@results))
    $(@el).html(@template(rooms: @results))

  drawCalendar: (event)->
    event.preventDefault()
    @events = new ConferenceScheduler.Collections.Events([], {id: parseInt(event.target.id)})
    @events.fetch({reset: true})
    calView = new ConferenceScheduler.Views.CalendarsShow(collection: @events)
    $('#calendar').html(calView.render().el)
    rname = event.target.innerText
    $('#room-name').html("<h3 class=\"text-center\">#{rname}</h1>")
    calView.$el.fullCalendar('render')
