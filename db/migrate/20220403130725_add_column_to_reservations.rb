class AddColumnToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :num_of_people, :integer
  end
end
