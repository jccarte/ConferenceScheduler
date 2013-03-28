class ConferenceScheduler.Views.CalendarsShow extends Backbone.View

  template: JST['calendars/show']

  initialize: ->

    @collection.on('sync', @addEvents, this)

  render: ->

    $(@el).fullCalendar({
      header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,basicWeek,basicDay',
            ignoreTimezone: false
        },
        selectable: true,
        selectHelper: true,
        editable: true,
        eventClick: (calEvent, jsEvent, view)->
          alert('Event: ' + calEvent.title)
        ,
        dayClick: ->
          alert('Day clicked!')

    })
    this

  addEvents: ->
    $(@el).fullCalendar('addEventSource', @collection.toJSON())
    console.log(@collection.length)

  eventClick: ->
