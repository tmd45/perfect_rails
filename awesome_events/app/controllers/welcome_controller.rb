class WelcomeController < ApplicationController
  PER = 3

  def index
    @events = Event.page(params[:page]).per(PER).
      where('start_time > ?', Time.current).order(:start_time)
  end
end
