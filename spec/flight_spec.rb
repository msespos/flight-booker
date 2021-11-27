# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

describe Flight do
  let!(:BUR) { create(:airport, :burbank) }
  let!(:LAX) { create(:airport, :la) }
  let!(:BED) { create(:airport, :bedford) }
  let!(:BOS) { create(:airport, :boston) }

  let!(:BUR_LAX_nov1) do
    create(:flight, :departing_on_nov1, :departing_from_BUR, :arriving_at_LAX)
  end

  let!(:BUR_BOS_nov1) do
    create(:flight, :departing_on_nov1, :departing_from_BUR, :arriving_at_BOS)
  end

  let!(:LAX_BOS_nov2_a) do
    create(:flight, :departing_on_nov2, :departing_from_LAX, :arriving_at_BOS)
  end

  let!(:LAX_BOS_nov2_b) do
    create(:flight, :departing_on_nov2, :departing_from_LAX, :arriving_at_BOS)
  end

  let!(:LAX_BOS_nov2_c) do
    create(:flight, :departing_on_nov2, :departing_from_LAX, :arriving_at_BOS)
  end

  describe '#find_flights' do
    context 'when passed search criteria which would lead to a
             nonempty result' do
      it 'does not return an empty record' do
        search_criteria = { departure_airport_id: '1', arrival_airport_id: '2',
                            departure_date: '01/11/2021' }
        found_flights = Flight.find_flights(search_criteria)
        expect(found_flights).to_not eq([])
      end
    end

    context 'when passed search criteria which would lead to a
             result arriving in BOS' do
      it 'returns a result arriving in BOS' do
        search_criteria = { departure_airport_id: '1', arrival_airport_id: '4',
                            departure_date: '01/11/2021' }
        found_flights = Flight.find_flights(search_criteria)
        arrival_airport_code = found_flights[0][:arrival_airport_id]
        expect(arrival_airport_code).to eq(4)
      end
    end

    context 'when passed search criteria which would lead to three results' do
      it 'returns three results' do
        search_criteria = { departure_airport_id: '2', arrival_airport_id: '4',
                            departure_date: '02/11/2021' }
        found_flights = Flight.find_flights(search_criteria)
        expect(found_flights.size).to eq(3)
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
