class City < ApplicationRecord
  has_many :places
  has_many :sunsets
end
