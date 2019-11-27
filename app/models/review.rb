class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :user
  mount_uploader :image, PhotoUploader
end
