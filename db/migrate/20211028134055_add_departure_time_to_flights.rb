# frozen_string_literal: true

# Add departure time to flights
class AddDepartureTimeToFlights < ActiveRecord::Migration[6.1]
  def change
    add_column :flights, :departure_time, :time
  end
end
