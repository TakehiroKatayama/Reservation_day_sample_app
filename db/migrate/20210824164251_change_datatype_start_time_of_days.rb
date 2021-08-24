class ChangeDatatypeStartTimeOfDays < ActiveRecord::Migration[6.1]
  def change
    change_column :days, :start_time, :date
  end
end
