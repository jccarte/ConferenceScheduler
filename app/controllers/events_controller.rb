class EventsController < ApplicationController
  def as_json(options = {})
    {
      :id => self.id,
      :title => self.title,
      :description => self.description || "",
      :start => starts_at.rfc822,
      :end => ends_at.rfc822,
      :allDay => false,
      :recurring => false,
      :url => Rails.application.routes.url_helpers.event_path(id)
    }

  end
  def index
    @events = Event.all

    respond_to do |format|
      format.html
      format.json  { render :json => @events }
      format.js  { render :json => @events }
    end
  end
end
