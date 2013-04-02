class ConferenceScheduler.Views.CalendarsShow extends Backbone.View

  template: JST['calendars/show']

  initialize: ->
    _.bindAll this
    @collection.on('reset', @showEvents, this)
    @collection.on('add', @addEvent, this)
    @eventView = new ConferenceScheduler.Views.CalendarsNewEvent()

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

  dayClick: (startDate, endDate)->
    #@eventView.collection = @collection
    newEvent = new ConferenceScheduler.Models.Event({start: startDate, end: endDate}, {collId: @collection.getId()});
    eventView = new ConferenceScheduler.Views.CalendarsNewEvent(collection: @collection, model: newEvent)
    console.log("DAYCLICKED" + @collection.length)
    eventView.render()


