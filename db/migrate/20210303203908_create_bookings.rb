class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bicycle, null: false, foreign_key: true
      t.date :date_start
      t.date :date_end
      t.integer :price

      t.timestamps
    end
  end
end
