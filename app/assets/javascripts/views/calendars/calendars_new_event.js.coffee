class ConferenceScheduler.Views.CalendarsNewEvent extends Backbone.View
  el: '#eventDialog'

  initialize: ->
    _.bindAll this
  render: ->
    $(@el).dialog({
      modal: true
      title: 'New Event'
      buttons: {'Ok': @save, 'Cancel': @close}
      })
    this

  close: ->
    $('#eventDialog').dialog('close')

  save: ->
    @model.set({'title': $('#title').val(), 'color': $('#color').val()})
    @collection.create(@model, {success: @close})