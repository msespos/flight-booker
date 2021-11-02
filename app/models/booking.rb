# frozen_string_literal: true

# Booking class
class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passengers

  def self.passengers(number_of_passengers)
    passengers = []
    number_of_passengers.to_i.times do
      passengers << Passenger.new
    end
    passengers
  end
end
