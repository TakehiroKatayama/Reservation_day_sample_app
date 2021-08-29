class DropTableCapacities < ActiveRecord::Migration[6.1]
  def change
    drop_table :capacities
  end
end
