class Booking < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :date,{presence:true}
  validates :slot,{presence:true}
  # validate :check_num_of_a_slot
  #
  # def check_num_of_a_slot
  #   if Booking.slot.count > 4
  #     errors.add(:slot, "Choose other slots")
  #   end
  # end

  def check_num_of_a_slot
    selected_date = "2020-11-01 15:00"
    selected_slot = "11:30~11:45"
    if Booking.where(date: selected_date).where(slot: selected_slot).count > 3
      errors.add(:slot, "Choose other slots")
    end
  end

end
