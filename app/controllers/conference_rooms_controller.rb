class ConferenceRoomsController < ApplicationController

  def show
    @events = ConferenceRoom.find(params[:id]).Events

    respond_to do |format|
      format.html
      format.json  { render :json => @events }
      format.js  { render :json => @events }
    end
  end
end
