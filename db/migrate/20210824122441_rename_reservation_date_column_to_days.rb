class RenameReservationDateColumnToDays < ActiveRecord::Migration[6.1]
  def change
    rename_column :days, :reservation_date, :start_time
  end
end
