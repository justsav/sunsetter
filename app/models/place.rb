class Place < ApplicationRecord
  belongs_to :city
  has_many :bookings
  has_many :reviews, through: :bookings
end
