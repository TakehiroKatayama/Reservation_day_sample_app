class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :count_person
      t.references :day, null: false, foreign_key: true

      t.timestamps
    end
  end
end
