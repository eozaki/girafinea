class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
  end

  def new
  end
end
