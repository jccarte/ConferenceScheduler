class ConferenceRoomsController < ApplicationController

  def index
    @rooms = ConferenceRoom.all
    respond_to do |format|
      format.html
      format.json  { render :json => @rooms }
      format.js  { render :json => @rooms }
    end
  end

  def show
    @events = ConferenceRoom.find(params[:id]).Events

    respond_to do |format|
      format.html
      format.json  { render :json => @events }
      format.js  { render :json => @events }
    end
  end
end
