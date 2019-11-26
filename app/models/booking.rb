class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :place
  has_one :review


  validates :date, presence: true

end
