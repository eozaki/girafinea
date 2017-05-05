class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :format_start_time, only: [:create]

  def index
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
    @event.items.build
  end

  def update
    event_params[:items_attributes].each do |_, new_item|
      if new_item[:id] && Item.find(new_item[:id])
        Item.find(new_item[:id]).update(new_item)
      else
        Item.create(new_item.merge(event_id: params[:id]))
      end
    end
    redirect_to event_path(params[:id])
  end

  def new
  end

  def create
    event = Event.create(event_params)
    if event.persisted?
      redirect_to event_path(event)
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
  end

  def event_params
    params.require(:event).permit(
      :user_id,
      :title,
      :start_time,
      :description,
      :time,
      items_attributes: [:id, :title, :description, :quantity]
    )
  end
end
