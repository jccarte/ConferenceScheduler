class ConferenceScheduler.Views.CalendarsShow extends Backbone.View

  template: JST['calendars/show']

  initialize: ->
    @collection.on('reset', @render, this)

  render: ->
    alert @collection.length
    $(@el).html(@template(events: @collection))
    #$(@el).fullCalendar({
    #  header: {
    #        left: 'prev,next today',
    #        center: 'title',
    #        right: 'month,basicWeek,basicDay',
    #        ignoreTimezone: false
    #    },
    #    selectable: true,
    #    selectHelper: true,
    #    editable: true
#
    #})


#    $(@el).fullCalendar('addEventSource', @collection.toJSON())
    this

  addEvents: ->
    $(@el).fullCalendar('addEventSource', @collection.toJSON())
    alert @collection.length