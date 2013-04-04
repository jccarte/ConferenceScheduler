class ConferenceScheduler.Views.CalendarsShow extends Backbone.View

  template: JST['calendars/show']

  initialize: ->
    _.bindAll this
    @collection.on('reset', @showEvents, this)
    @collection.on('add', @addEvent, this)
    @collection.on('remove', @addEvent, this)
    @eventView = new ConferenceScheduler.Views.CalendarsNewEvent()

  render: ->
    $(@el).fullCalendar({
      header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
            ignoreTimezone: false
        },
        minTime: 6,

        maxTime: 21,
        allDayDefault: false,
        theme: true,
        selectable: true,
        selectHelper: true,
        editable: true,
        #endParam: "end_at",
        startParam: "start",
        eventClick: (calEvent, jsEvent, view)->
          alert('Event: ' + calEvent.title)
        ,
        select: @dayClick

    })
    this

  showEvents: ->
    $(@el).fullCalendar('addEventSource', @collection.toJSON())


  addEvent: (event)->
    console.log("addEvent called")
    #$(@el).fullCalendar('renderEvent', event.toJSON())
    $(@el).fullCalendar('removeEvents')
    $(@el).fullCalendar('addEventSource', @collection.toJSON())

  dayClick: (startDate, endDate, allDay)->
    #@eventView.collection = @collection
    console.log(allDay)
    newEvent = new ConferenceScheduler.Models.Event({start: startDate, end: endDate, allDay: allDay}, {collId: @collection.getId()});
    eventView = new ConferenceScheduler.Views.CalendarsNewEvent(collection: @collection, model: newEvent)
    eventView.render()


