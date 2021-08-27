class AddEmailToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :email, :string
  end
end
