class Event < ApplicationRecord
  belongs_to :user
  has_rich_text :description
  has_many :time_slots
end
