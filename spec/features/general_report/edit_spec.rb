# frozen_string_literal: true

require 'rails_helper'

feature 'User can edit the General Report', "
  In order to be able to fix mistakes in the General Report
  As a User
  I'd like to be able to edit the General Report
" do
  given(:general_report) { create(:general_report) }
  background { visit general_report_path(id: general_report, lang: 'en') }

  scenario 'User updates the General Report' do
    click_on 'Edit General Report'
    fill_in 'Title', with: 'New General Report Title'
    click_on 'Update General Report'

    expect(page).to have_content 'General Report has been successfully updated.'
    expect(page).to have_content 'New General Report Title'
  end

  scenario 'User tries to update the General Report with invalid attributes' do
    click_on 'Edit General Report'
    fill_in 'Title', with: ''
    click_on 'Update General Report'

    expect(page).to have_content 'There were some errors in your input.'
    expect(page).to have_content "Title can't be blank"
  end
end
