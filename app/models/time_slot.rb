class TimeSlot < ApplicationRecord
  belongs_to :event
  validates :available, inclusion: { in: [true, false] }

end
