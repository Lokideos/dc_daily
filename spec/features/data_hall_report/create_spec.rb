# frozen_string_literal: true

require 'rails_helper'

feature 'User can create Data Hall Report', "
  In order to keep updated information about main Data Hall attributes
  As a User
  I'd like to be able to create Data Hall Report
" do
  given(:general_report) { create(:general_report) }

  background { visit new_general_report_data_hall_report_path(general_report_id: general_report, lang: 'en') }

  scenario 'User creates the Data Hall Report' do
    fill_in 'Title', with: 'Data Hall Report'
    click_on 'Create Data Hall Report'

    expect(page).to have_content 'Data Hall Report has been successfully created.'
    expect(page).to have_content 'Data Hall Report'
  end

  scenario 'User tries to create Data Hall Report with invalid attributes' do
    click_on 'Create Data Hall Report'

    expect(page).to have_content 'There were some errors in your input.'
    expect(page).to have_content "Title can't be blank"
  end
end
