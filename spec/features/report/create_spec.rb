# frozen_string_literal: true

require 'rails_helper'

feature 'User can create the general report', "
  In order to have place to gather and save data into
  As a User
  I'd like to be able to create the general report
" do
  background { visit new_report_path }

  scenario 'User creates the report' do
    fill_in 'Title', with: 'New General Report'
    click_on 'Create Report'

    expect(page).to have_content 'Report has been successfully created.'
    expect(page).to have_content 'New General Report'
  end

  scenario 'User tries to create the report with invalid attributes' do
    click_on 'Create Report'

    expect(page).to have_content 'There were some errors in your input.'
    expect(page).to have_content "Title can't be blank"
  end
end
