class Day < ApplicationRecord
  has_many :reservations
  # has_one :capacity
end
