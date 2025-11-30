class AddIndexToGuests < ActiveRecord::Migration[8.0]
  def change
    add_index :guests, :phone, unique: true
  end
end
