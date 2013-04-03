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
    #$('#timepicker').timepicker();

  close: ->
    $('#eventDialog').dialog('close')

  handleError: (event, response)->
     if response.status == 422
      errors  = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute}: #{message}" for message in messages
      @collection.remove(event)
      @close()

  save: ->
    @model.set({'title': $('#title').val(), 'color': $('#color').val()})
    @collection.create(@model, {success: @close, error: @handleError})