# frozen_string_literal: true

require 'rails_helper'

feature 'User can create the general general_report', "
  In order to have place to gather and save data into
  As a User
  I'd like to be able to create the general general_report
" do
  background { visit new_general_report_path }

  scenario 'User creates the general_report' do
    fill_in 'Title', with: 'New General Report'
    click_on 'Create General Report'

    expect(page).to have_content 'General Report has been successfully created.'
    expect(page).to have_content 'New General Report'
  end

  scenario 'User tries to create the general_report with invalid attributes' do
    click_on 'Create General Report'

    expect(page).to have_content 'There were some errors in your input.'
    expect(page).to have_content "Title can't be blank"
  end
end
