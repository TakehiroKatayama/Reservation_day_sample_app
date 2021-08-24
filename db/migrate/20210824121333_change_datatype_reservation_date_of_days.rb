class ChangeDatatypeReservationDateOfDays < ActiveRecord::Migration[6.1]
  def change
    change_column :days, :reservation_date, :datetime
  end
end
