class AddCapacityToDays < ActiveRecord::Migration[6.1]
  def change
    add_column :days, :capacity, :integer, default: 20
  end
end
