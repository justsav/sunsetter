class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :place
  has_one :review, dependent: :destroy


  validates :date, presence: true

end
