class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.datetime :departure_datetime
      t.time :duration
      t.bigint :departure_airport_id
      t.bigint :arrival_airport_id

      t.timestamps
    end
  end
end
