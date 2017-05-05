class ItemsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @event.items.build
  end

  def create
    event_params[:items_attributes].each do |_, new_item|
      if new_item[:id] && Item.find(new_item[:id])
        Item.find(new_item[:id]).update(new_item)
      else
        Item.create(new_item.merge(event_id: params[:event_id]))
      end
    end
    redirect_to event_path(params[:event_id])
  end

  private

  def event_params
    params.require(:event).permit(
      :user_id,
      :title,
      :time,
      items_attributes: [:id, :title, :description, :quantity]
    )
  end
end
