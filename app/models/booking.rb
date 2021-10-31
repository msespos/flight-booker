# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passengers

  def self.passengers(number_of_passengers)
    passengers = []
    number_of_passengers.to_i.times do |passenger_number|
      passengers << Passenger.new
    end
    passengers
  end
end
