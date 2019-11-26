class City < ApplicationRecord
  has_many :places, dependent: :destroy
  has_many :sunsets, dependent: :destroy
end
