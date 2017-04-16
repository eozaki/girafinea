class Event < ActiveRecord::Base
  belongs_to :user
  has_many :items

  validates :title, :description, :start_time, presence: true
end
