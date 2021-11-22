# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

describe Flight do
  let(:BUR_LAX_nov1) do
    create(:flight, traits: %i[departing_on_nov1
                               departing_from_BUR arriving_at_LAX])
  end
  let(:BUR_LAX_nov2) do
    create(:flight, traits: %i[departing_on_nov2
                               departing_from_BUR arriving_at_LAX])
  end
  let(:BUR_LAX_nov3) do
    create(:flight, traits: %i[departing_on_nov3
                               departing_from_BUR arriving_at_LAX])
  end

  describe '#find_flights' do
    context 'when passed search criteria which would lead to a
             nonempty result' do
      it 'does not return an empty record' do
        search_criteria = { departure_airport_id: '1', arrival_airport_id: '2',
                            departure_date: '01/11/2021' }
        found_flights = Flight.find_flights(search_criteria)
        puts "count is #{Flight.all.count}"
        expect(found_flights).to_not eq([])
      end
    end

    context 'when passed search criteria which would lead to a
             single result arriving in BOS' do
      xit 'returns a result arriving in BOS' do
        search_criteria = { departure_airport_id: '1', arrival_airport_id: '4',
                            departure_date: '01/11/2021' }
        found_flights = Flight.find_flights(search_criteria)
        arrival_airport_code = found_flights[0][:arrival_airport_id]
        expect(arrival_airport_code).to eq(4)
      end
    end

    context 'when passed search criteria which would lead to three results' do
      xit 'returns three results' do
        search_criteria = { departure_airport_id: '2', arrival_airport_id: '4',
                            departure_date: '01/11/2021' }
        found_flights = Flight.find_flights(search_criteria)
        expect(found_flights.size).to eq(3)
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
