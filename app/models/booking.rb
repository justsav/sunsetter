class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :place
  has_one :review, dependent: :destroy
  has_many :guests


  validates :date, presence: true
  validates :date, uniqueness: { scope: :user,
    message: "You've already made a booking for this date." }

end
