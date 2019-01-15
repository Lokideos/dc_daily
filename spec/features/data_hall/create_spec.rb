# frozen_string_literal: true

require 'rails_helper'

feature 'User creates data hall', "
  In order to keep information about data hall
  As a User
  I'd like to be able to create data halls
" do
  given(:data_hall_report) { create(:data_hall_report) }

  background { visit new_data_hall_report_data_hall_path(data_hall_report_id: data_hall_report, lang: 'en') }

  scenario 'User creates data hall' do
    fill_in 'Title', with: 'New Data Hall'
    fill_in 'Description', with: 'New Data Hall Description'

    click_on 'Create'

    expect(page).to have_content 'New Data Hall'
    expect(page).to have_content 'New Data Hall Description'
    expect(page).to have_content 'You have successfully created Data Hall.'
  end

  scenario 'User tries to create data hall with invalid attributes' do
    click_on 'Create'

    expect(page).to have_content 'There were some errors in your input.'
    expect(page).to have_content "Title can't be blank"
  end
end
