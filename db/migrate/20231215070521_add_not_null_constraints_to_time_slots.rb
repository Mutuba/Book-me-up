class AddNotNullConstraintsToTimeSlots < ActiveRecord::Migration[7.0]
  def change
    change_column :time_slots, :start_at, :datetime, null: false
    change_column :time_slots, :end_at, :datetime, null: false
  end
end
