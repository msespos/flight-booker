# frozen_string_literal: true

# Create Airports class
class CreateAirports < ActiveRecord::Migration[6.1]
  def change
    create_table :airports do |t|
      t.string :code

      t.timestamps
    end
  end
end
