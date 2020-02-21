# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can delete an existing post' do
    sign_up
    visit '/albums'
    click_link 'New Album'
    fill_in 'album_title', with: 'Title, test!'
    attach_file('album[images][]', Rails.root + 'public/uploads/album/images/2/cool-background.png')
    click_button 'Create Album'
    expect(page).to have_content('Title, test!')
    click_link 'Back'
    click_link 'Destroy'
    expect(page).to have_no_content('Title, test!' + 'public/uploads/album/images/2/cool-background.png')
  end
end
