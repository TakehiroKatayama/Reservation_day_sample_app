class Reservation < ApplicationRecord
  belongs_to :day
  belongs_to :user

  enum status: {
    visiting: 0,
    visited: 1,
    cancel: 2
  }
end
