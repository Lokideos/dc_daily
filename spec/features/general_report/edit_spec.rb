# frozen_string_literal: true

require 'rails_helper'

feature 'User can edit the general_report', "
  In order to be able to fix mistakes in the general_report
  As a User
  I'd like to be able to edit the general_report
" do
  given(:general_report) { create(:general_report) }
  background { visit general_report_path(id: general_report, lang: 'en') }

  scenario 'User updates the general_report' do
    click_on 'Edit General Report'
    fill_in 'Title', with: 'New General Report Title'
    click_on 'Update General Report'

    expect(page).to have_content 'General Report has been successfully updated.'
    expect(page).to have_content 'New General Report Title'
  end

  scenario 'User tries to update the general_report with invalid attributes' do
    click_on 'Edit General Report'
    fill_in 'Title', with: ''
    click_on 'Update General Report'

    expect(page).to have_content 'There were some errors in your input.'
    expect(page).to have_content "Title can't be blank"
  end
end
