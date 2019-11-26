class Place < ApplicationRecord
  belongs_to :city
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
end
