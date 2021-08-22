class CreateCapacities < ActiveRecord::Migration[6.1]
  def change
    create_table :capacities do |t|
      t.integer :remaining_count
      t.references :day, null: false, foreign_key: true

      t.timestamps
    end
  end
end
