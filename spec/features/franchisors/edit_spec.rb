require 'rails_helper'

RSpec.describe 'The Franchisor Edit' do
  before :each do
    @cfa = Franchisor.create!(name: "Chick-Fil-A", hq_city: "Atlanta", hq_state: "Georgia", quick_service: true, franchisee_cost: 10000.0)
    @applebees = Franchisor.create!(name: "Applebees", hq_city: "Glendale", hq_state: "California", quick_service: false, franchisee_cost: 30000.0)
    @garbanzo = Franchisor.create!(name: "Garbanzo", hq_city: "Centennial", hq_state: "Colorado", quick_service: true, franchisee_cost: 25000.0)
  end

  it 'links to the edit page' do
    visit '/franchisors'
    click_button("Edit #{@applebees.name}")

    expect(current_path).to eq("/franchisors/#{@applebees.id}/edit")
  end

  it 'can edit the franchisor name' do
    visit "/franchisors"
    expect(page).to have_content("Applebees")

    click_button('Edit Applebees')
    fill_in('Name', with: 'Applebees1')
    click_button('Update Franchisor')

    expect(current_path).to eq("/franchisors")
    expect(page).to have_content('Applebees1')
  end

  it 'can edit the franchisor attributes' do
    visit "/franchisors/#{@applebees.id}"
    expect(page).to have_content("Glendale")
    expect(page).to have_content("California")
    expect(page).to have_content("Quick Service Restaurant? false")
    expect(page).to have_content(30000.0)

    visit "/franchisors"

    click_button('Edit Applebees')
    fill_in('HQ City', with: 'Denver')
    fill_in('HQ State', with: 'Colorado')
    page.check('Quick Service Restaurant?')
    fill_in('Franchisee Cost', with: 27000.0)
    click_button('Update Franchisor')

    visit "/franchisors/#{@applebees.id}"
    expect(page).to have_content('Denver')
    expect(page).to have_content('Colorado')
    expect(page).to have_content('Quick Service Restaurant? true')
    expect(page).to have_content(27000.0)
  end
end
