# frozen_string_literal: true

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can create a post' do
    sign_up
    visit '/albums'
    click_link 'New Album'
    fill_in 'album_title', with: 'Title, test!'
    attach_file('album[images][]', Rails.root + 'public/uploads/album/images/2/cool-background.png')
    click_button 'Create Album'
    click_link 'Back'
    expect(page).to have_content('Title, test!')
  end

  scenario 'Error when uploading non allowed file' do
    sign_up
    visit '/albums'
    click_link 'New Album'
    fill_in 'album_title', with: 'Title, test!'
    attach_file('album[images][]', Rails.root + 'app/jobs/application_job.rb')
    click_button 'Create Album'
    expect { unprocessable_entity }.to raise_error
  end
end
