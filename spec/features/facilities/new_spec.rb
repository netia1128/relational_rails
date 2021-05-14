require 'rails_helper'

RSpec.describe 'facilities new page', type: :feature do

  it 'allows you to enter details to add a new facility' do
    visit "/facilities/new"

    expect(page).to have_content('Street Number:')
    expect(page).to have_content('Street Prefix:')
    expect(page).to have_content('Street Name:')
    expect(page).to have_content('Street Type:')
    expect(page).to have_content('Unit Info:')
    expect(page).to have_content('City:')
    expect(page).to have_content('Zip Code:')
    expect(page).to have_content('Square Footage:')
    expect(page).to have_content('Has Certificate of Occupancy?')
  end

  it 'redirects you to the facilities page after creating a new record' do
    visit "/facilities/new"
    page.fill_in 'facility[b3_street_number]', with: '1311'
    page.fill_in 'facility[b3_street_name]', with: '27TH'
    page.fill_in 'facility[b3_street_type]', with: 'Ave'
    page.fill_in 'facility[b3_zip]', with: '80205'
    page.fill_in 'facility[b3_square_footage]', with: 700
    click_on 'Add Facility'

    expect(current_path).to eq("/facilities")
    expect(page).to have_content("27TH AVE DENVER CO 80205")
  end
end

    # save_and_open_page