class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :place
  has_one :review, dependent: :destroy


  validates :date, presence: true
  validates :date, uniqueness: { scope: :user,
    message: "You've already made a booking for this date." }

end
