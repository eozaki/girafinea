class Event < ActiveRecord::Base
  belongs_to :user
  has_many :items

  validates :title, :description, :start_time, presence: true
  accepts_nested_attributes_for :items
end
