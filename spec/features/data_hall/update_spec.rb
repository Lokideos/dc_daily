# frozen_string_literal: true

require 'rails_helper'

feature 'User updates data hall', "
  In order to keep information about data hall updated
  As a User
  I'd like to be able to update data hall information
" do
  given(:data_hall) { create(:data_hall) }

  background { visit edit_data_hall_path(id: data_hall, lang: 'en') }

  scenario 'User updates data hall information' do
    fill_in 'Title', with: 'Updated Data Hall Title'
    fill_in 'Description', with: 'Updated Data Hall Description'

    click_on 'Update'

    expect(page).to have_content 'Updated Data Hall Title'
    expect(page).to have_content 'Updated Data Hall Description'
    expect(page).to have_content 'You have successfully updated the Data Hall.'
  end

  scenario 'User tries to update data hall information with invalid attributes' do
    fill_in 'Title', with: ''
    fill_in 'Description', with: 'Updated Data Hall Description'

    click_on 'Update'

    expect(page).to have_content 'There were some errors in your input.'
    expect(page).to have_content "Title can't be blank"
  end
end
