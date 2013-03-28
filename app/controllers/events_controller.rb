class EventsController < ApplicationController
  respond_to :json

  def index
    respond_with Event.all
    #@events = Event.all
#
#    #respond_to do |format|
#    #  format.html { render :json => @events }
#    #  format.json  { render :json => @events }
    #  format.js  { render :json => @events }
    #end
  end
end
