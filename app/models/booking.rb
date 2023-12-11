class Booking < ApplicationRecord
  belongs_to :time_slot
  before_create :mark_time_slot_unavailable

  private

  def mark_time_slot_unavailable
    time_slot.update(available: false)
  end
end
