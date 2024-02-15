class CreateCarReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :car_reservations do |t|
      t.date :reserved_date
      t.datetime :start_time
      t.datetime :end_time
      t.string :start_location
      t.string :destination
      t.float :total_cost
      t.references :user, null: false, foreign_key: true
      t.references :car, null: false, foreign_key: true

      t.timestamps
    end
  end
end