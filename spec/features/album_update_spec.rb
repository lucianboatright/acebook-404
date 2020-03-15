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
    click_link 'Edit'
    fill_in 'album_title', with: 'Update, Test!'
    click_button 'Update Album'
    expect(page).to have_content('Update, Test!')
    expect(page).to have_content('Album was updated')
  end

  scenario 'Error when uploading non allowed file' do
    sign_up
    visit '/albums'
    click_link 'New Album'
    fill_in 'album_title', with: 'Title, test!'
    click_button 'Create Album'
    expect(page).to have_content('Title, test!')
    click_link 'Back'
    click_link 'Edit'
    fill_in 'album_title', with: 'Update, Test!'
    attach_file('album[images][]', Rails.root + 'app/jobs/application_job.rb')
    click_button 'Update Album'
    expect { unprocessable_entity }.to raise_error
  end
end
