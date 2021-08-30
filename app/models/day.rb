class Day < ApplicationRecord
  has_many :reservations

  validates :capacity, numericality: { greater_than_or_equal_to: 0 }
 
end
