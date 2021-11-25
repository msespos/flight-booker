# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Search, select and book a flight', type: :feature do
  let!(:BUR) { create(:airport, :burbank) }
  let!(:LAX) { create(:airport, :la) }

  let!(:BUR_LAX_nov1) do
    create(:flight, :departing_on_nov1, :departing_from_BUR, :arriving_at_LAX)
  end
  
  scenario 'from BUR to LAX on 01/11/2021 at 12:00PM with one passenger' do
    visit root_path
    select 'LAX', from: 'flight_arrival_airport_id'
    click_on 'Search!'
    choose 'flight_id_1'
    click_on 'Select!'
    fill_in 'booking_passenger_0_name', with: 'Mike'
    fill_in 'booking_passenger_0_email', with: 'mike@mike.mike'
    click_on 'Book it!'
    expect(page).to have_content('Passenger 1: Mike; Email: mike@mike.mike')
  end

  scenario 'from BUR to LAX on 01/11/2021 at 12:00PM with four passengers' do
    visit root_path
    select 'LAX', from: 'flight_arrival_airport_id'
    select '4', from: 'number_of_passengers'
    click_on 'Search!'
    choose 'flight_id_1'
    click_on 'Select!'
    #all('booking_passenger__name')[3].set('Mike')
    find(:css, "input[id$='booking_passenger__name']")[3].set('Mike')
    #within(all('booking_passenger__name')[3]) do
      #fill_in 'booking_passenger__name', with: 'Mike'
    #end
    fill_in 'booking_passenger_3_name', with: 'Mike'
    fill_in 'booking_passenger_3_email', with: 'mike@mike.mike'
    click_on 'Book it!'
    expect(page).to have_content('Passenger 4: Mike; Email: mike@mike.mike')
  end
end
