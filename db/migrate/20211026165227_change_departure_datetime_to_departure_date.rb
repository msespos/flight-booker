# frozen_string_literal: true

# Change departure_datetime to departure_date
class ChangeDepartureDatetimeToDepartureDate < ActiveRecord::Migration[6.1]
  def change
    rename_column :flights, :departure_datetime, :departure_date
  end
end
