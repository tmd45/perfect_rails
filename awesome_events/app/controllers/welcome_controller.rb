class WelcomeController < ApplicationController
  def index
    @events = Event.where('start_time > ?', Time.current).order(:start_time)
  end
end
