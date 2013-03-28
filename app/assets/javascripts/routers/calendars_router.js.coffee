class ConferenceScheduler.Routers.Calendars extends Backbone.Router

  routes:
    '': 'index'
    'calendars/:id': 'show'

  initialize: ->
    @collection = new ConferenceScheduler.Collections.Calendars([], {id: 1})
    @collection.fetch()

  index: ->
    view = new ConferenceScheduler.Views.CalendarsIndex()
    $('#container').html(view.render().el)

  show: (id)->
    #@collection = new ConferenceScheduler.Collections.Calendars([], {id: parseInt(id)})
    #@collection.fetch()
    view = new ConferenceScheduler.Views.CalendarsShow(collection: @collection)
    $('#container').html(view.render().el)
