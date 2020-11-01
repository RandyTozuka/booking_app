class Booking < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :date,{presence:true}
  validates :slot,{presence:true}
  validate :check_num_of_a_slot

  def check_num_of_a_slot
    if Booking.slot.count > 150
      errors.add(:slot, "Choose other slots")
    end
  end
end
