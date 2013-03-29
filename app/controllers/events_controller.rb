class EventsController < ApplicationController
  respond_to :json

  def index
    respond_with Event.all
  end
  def show
    #respond_with Entry.find(params[:id])
  end

  def create
    print params
    respond_with Event.create(params[:event].merge(conference_room_id: params[:conference_room_id]))
  end

  def update
  #  respond_with Entry.update(params[:id], params[:entry])
  end

  def destroy
    #respond_with Entry.destroy(params[:id])
  end
end
