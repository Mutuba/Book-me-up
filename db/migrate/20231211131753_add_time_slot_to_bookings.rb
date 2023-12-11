class AddTimeSlotToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :time_slot, null: false, foreign_key: true
  end
end
