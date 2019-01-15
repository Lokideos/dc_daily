# frozen_string_literal: true

require 'rails_helper'

feature 'User can delete data hall', "
  In order to keep information about data halls in check
  As a User
  I'd like to be able to delete data halls
" do
  given(:data_hall) { create(:data_hall) }

  scenario 'User deletes data hall' do
    visit data_hall_path(data_hall, lang: 'en')

    click_on 'Delete Data Hall'

    expect(page).to have_content 'Data Hall has been successfully deleted.'
    expect(page).to_not have_content data_hall.title
  end
end
