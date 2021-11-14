# frozen_string_literal: true

require 'rails_helper'

describe Booking do
  describe '#create_passengers' do
    context 'when passed 0' do
      it 'returns an empty array' do
        expect(Booking.create_passengers(0)).to eq([])
      end
    end
    context 'when passed 1' do
      it 'returns an array with one passenger' do
        passenger = Passenger.new
        expect(Booking.create_passengers(1)).to eq([passenger])
      end
    end
  end
end
