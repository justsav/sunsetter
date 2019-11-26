class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :place
  has_one :review

  validates :name
  validates :state
  validates :description
  validates :date, presence: true
  validates :public, presence: true, default: false
end
