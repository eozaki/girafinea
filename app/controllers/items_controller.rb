class ItemsController < ApplicationController
  def edit
    @event = Event.find(params[:event_id])
    @event.items.build
  end

  def update
    binding.pry
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
