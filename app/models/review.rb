class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :user
  mount_uploader :image, PhotoUploader

  validates :rating, presence: true, numericality: { only_integer: true }
  validates :rating, inclusion: { in: (1..5).to_a }
end
