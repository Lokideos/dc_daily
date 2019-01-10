# frozen_string_literal: true

require 'rails_helper'

feature 'User can edit the Data Hall Report', "
  In order to fix or edit information about the Data Hall Report
  As a User
  I'd like to be able to edit the Data Hall Report
" do
  given(:general_report) { create(:general_report) }
  given(:data_hall_report) { create(:data_hall_report) }

  background { visit edit_data_hall_report_path(id: data_hall_report, lang: 'en') }

  scenario 'User updates the Data Hall Report' do
    fill_in 'Title', with: 'Updated Data Hall Report'
    click_on 'Update Data Hall Report'

    expect(page).to have_content 'Data Hall Report has been successfully updated.'
    expect(page).to have_content 'Updated Data Hall Report'
  end

  scenario 'User tries to update the Data Hall Report with invalid attributes' do
    fill_in 'Title', with: ''
    click_on 'Update Data Hall Report'

    expect(page).to have_content 'There were some errors in your input.'
    expect(page).to have_content "Title can't be blank"
  end
end
