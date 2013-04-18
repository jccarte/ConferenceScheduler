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
            right: 'month,agendaWeek,agendaDay',

        },
        minTime: 6,
        aspectRatio:2,
        maxTime: 21,
        ignoreTimezone: false,
        allDayDefault: false,
        theme: true,
        selectable: true,
        defaultEventMinutes: 1440,
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

    view = $(@el).fullCalendar('getView').name
    if startDate.toString() == endDate.toString() && view == 'month'
      $(@el).fullCalendar('gotoDate', startDate)
      $(@el).fullCalendar('changeView', 'agendaWeek')
      return
    if allDay
      console.log endDate.getHours()
      endDate.setHours(23)
    console.log(endDate)
    newEvent = new ConferenceScheduler.Models.Event({start: startDate, end: endDate, allDay: allDay}, {collId: @collection.getId()});
    eventView = new ConferenceScheduler.Views.CalendarsNewEvent(collection: @collection, model: newEvent)
    eventView.render()


