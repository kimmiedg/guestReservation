class CreateReservations < ActiveRecord::Migration[8.0]
  def change
    create_table :reservations do |t|
      t.date :start_date
      t.date :end_date
      t.integer :no_of_nights, default: 0, null: false
      t.integer :no_of_guests, default: 0, null: false
      t.integer :adults, default: 0, null: false
      t.integer :infants, default: 0, null: false
      t.integer :children, default: 0, null: false
      t.string :status
      t.string :currency
      t.decimal :payout_price, precision: 10, scale: 2, default: 0, null: false
      t.decimal :security_price, precision: 10, scale: 2, default: 0, null: false
      t.decimal :total_price, precision: 10, scale: 2, default: 0, null: false

      t.timestamps null: false
    end
  end
end
