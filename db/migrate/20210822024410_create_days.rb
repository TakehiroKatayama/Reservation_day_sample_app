class CreateDays < ActiveRecord::Migration[6.1]
  def change
    create_table :days do |t|
      t.date :reservation_date

      t.timestamps
    end
  end
end
