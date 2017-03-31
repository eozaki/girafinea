class Event < ActiveRecord::Base
  belongs_to :user

  validates :title, :description, :start_time, presence: true
end
