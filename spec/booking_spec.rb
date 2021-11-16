# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

describe Booking do
  describe '#create_passengers' do
    context 'when passed 0' do
      it 'returns an empty array' do
        booking = Booking.create_passengers(0)
        expect(booking).to eq([])
      end
    end
    context 'when passed 1' do
      it 'returns an array with one passenger' do
        booking = Booking.create_passengers(1)
        expect(booking.length).to eq(1)
      end
    end
    context 'when passed 1' do
      it 'returns an array with one passenger with the correct attributes' do
        booking = Booking.create_passengers(1)
        expect(booking[0]).to have_attributes(id: nil, name: nil, email: nil,
                                              booking_id: nil, created_at: nil,
                                              updated_at: nil)
      end
    end
    context 'when passed 4' do
      it 'returns an array with four passengers' do
        booking = Booking.create_passengers(4)
        expect(booking.length).to eq(4)
      end
    end
    context 'when passed 4' do
      it 'returns an array with with the correct attributes for the fourth
          passenger' do
        booking = Booking.create_passengers(4)
        expect(booking[3]).to have_attributes(id: nil, name: nil, email: nil,
                                              booking_id: nil, created_at: nil,
                                              updated_at: nil)
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
