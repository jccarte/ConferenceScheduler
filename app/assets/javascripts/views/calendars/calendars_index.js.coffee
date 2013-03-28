class ConferenceScheduler.Views.CalendarsIndex extends Backbone.View

  template: JST['calendars/index']

  render: ->
    $(@el).html(@template())
    this