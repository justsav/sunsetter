class Sunset < ApplicationRecord
  belongs_to :city

  validates :start, presence: true
  validates :end, presence: true
  validates :gold_start, presence: true
  validates :gold_end, presence: true
  validates :date, presence: true
end
