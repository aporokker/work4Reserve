class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :roomname
      t.string :image
      t.string :info
      t.integer :price
      t.string :address

      t.timestamps
    end
  end
end
