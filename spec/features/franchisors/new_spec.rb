require 'rails_helper'

RSpec.describe 'New Franchisor Creation' do
  it 'links to a new page from Franchisor Index' do
    visit '/franchisors'

    click_link('New Franchisor')
    expect(current_path).to eq('/franchisors/new')
  end

  it 'can create a new franchisor' do
    visit 'franchisors/new'

    fill_in('Name', with: 'Garbanzo')
    fill_in('HQ City', with: 'Centennial')
    fill_in('HQ State', with: 'Colorado')
    page.check('Quick Service Restaurant?')
    fill_in('Franchisee Cost', with: 25000)

    click_button('Create Franchisor')

    expect(current_path).to eq("/franchisors")
    expect(page).to have_content("Garbanzo")
  end
end
