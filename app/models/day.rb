class Day < ApplicationRecord
  has_many :reservations, dependent: :destroy
end
