# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Perform the first search and select a flight', type: :feature do
  let!(:BUR) { create(:airport, :burbank) }
  let!(:LAX) { create(:airport, :la) }
  let!(:BED) { create(:airport, :bedford) }
  let!(:BOS) { create(:airport, :boston) }

  let!(:BUR_LAX_nov1) do
    create(:flight, :departing_on_nov1, :departing_from_BUR, :arriving_at_LAX)
  end

  let!(:LAX_BOS_nov3) do
    create(:flight, :departing_on_nov3, :departing_from_LAX, :arriving_at_BOS)
  end
  
  scenario 'from BUR to LAX on 01/11/2021 at 12:00PM' do
    visit root_path
    select 'LAX', from: 'flight_arrival_airport_id'
    click_on 'Search!'
    choose 'flight_id_1'
    click_on 'Select!'
    expect(page).to have_content('Review your flight info:')
  end

  scenario 'for a flight from LAX to BOS on 11/3' do
    visit root_path
    select 'LAX', from: 'flight_departure_airport_id'
    select 'BOS', from: 'flight_arrival_airport_id'
    select '03/11/2021', from: 'flight_departure_date'
    click_on 'Search!'
    choose 'flight_id_2'
    click_on 'Select!'
    expect(page).to have_content('Review your flight info:')
  end
end
