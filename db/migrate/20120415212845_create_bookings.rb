class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :inflatable_id
      t.datetime :party_date
      t.integer :duration
      t.text :address

      t.timestamps
    end
    add_index :bookings, :inflatable_id
  end
end
