# frozen_string_literal: true

require 'rails_helper'

feature 'User can edit the report', "
  In order to be able to fix mistakes in the report
  As a User
  I'd like to be able to edit the report
" do
  given(:report) { create(:report) }
  background { visit report_path(id: report, lang: 'en') }

  scenario 'User updates the report' do
    click_on 'Edit Report'
    fill_in 'Title', with: 'New Report Title'
    click_on 'Update Report'

    expect(page).to have_content 'Report has been successfully updated.'
    expect(page).to have_content 'New Report Title'
  end

  scenario 'User tries to update the report with invalid attributes' do
    click_on 'Edit Report'
    fill_in 'Title', with: ''
    click_on 'Update Report'

    expect(page).to have_content 'There were some errors in your input.'
    expect(page).to have_content "Title can't be blank"
  end
end
