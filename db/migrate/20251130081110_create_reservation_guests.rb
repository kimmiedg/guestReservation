class CreateReservationGuests < ActiveRecord::Migration[8.0]
  def change
    create_table :reservation_guests do |t|
      t.references :reservation, null: false, foreign_key: true
      t.references :guest, null: false, foreign_key: true

      t.timestamps null: false
    end

    add_index :reservation_guests, [:reservation_id, :guest_id], unique: true
  end
end
