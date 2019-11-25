class Location < ApplicationRecord
  belongs_to :user
  validates :city, presence: true
end
