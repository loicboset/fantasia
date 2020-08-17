class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.references :character, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end