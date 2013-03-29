class ConferenceScheduler.Routers.Calendars extends Backbone.Router

  routes:
    '': 'index'
    'calendars/:id': 'show'

  initialize: ->
    @rooms = new ConferenceScheduler.Collections.ConferenceRooms()
    @rooms.fetch({error:  ->  console.log(arguments) })

  index: ->
    view = new ConferenceScheduler.Views.CalendarsIndex(collection: @rooms)
    $('#container').html(view.render().el)
    view.$el.fullCalendar('render')

  show: (id)->

    @events = new ConferenceScheduler.Collections.Events([], {id: parseInt(id)})
    @events.fetch({error:  ->  console.log(arguments) })
    view = new ConferenceScheduler.Views.CalendarsShow(collection: @events)
    $('#container').html(view.render().el)
    view.$el.fullCalendar('render')

