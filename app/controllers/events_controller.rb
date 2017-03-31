class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :format_start_time, only: [:create]

  def index
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
  end

  def new
  end

  def create
    event = Event.create(event_params)
    if event.persisted?
      redirect_to event_show_path(event)
      return
    end
    render action: :new, event: event
  end

  private

  def format_start_time
    a = params[:event]
    params[:event][:start_time] =
      Time.new(
        a['start_time(1i)'],
        a['start_time(2i)'],
        a['start_time(3i)'],
        a['start_time(4i)'],
        a['start_time(5i)']
      )
    params[:event].keep_if { |k| Event.new.attributes.keys.include? k }
  end

  def event_params
    params.require(:event).permit(:title, :description, :start_time, :user)
          .merge(user: current_user)
  end
end
