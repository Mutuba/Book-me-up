class TimeSlot < ApplicationRecord
  belongs_to :event
  validates :available, inclusion: { in: [true, false] }

  validates :start_at, :end_at, presence :true

end
