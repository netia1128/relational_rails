require 'rails_helper'

RSpec.describe 'The Franchisor Edit' do
  before :each do
    @cfa = Franchisor.create!(name: "Chick-Fil-A", hq_city: "Atlanta", hq_state: "Georgia", quick_service: true, franchisee_cost: 10000.0)
    @applebees = Franchisor.create!(name: "Applebees", hq_city: "Glendale", hq_state: "California", quick_service: false, franchisee_cost: 30000.0)
    @garbanzo = Franchisor.create!(name: "Garbanzo", hq_city: "Centennial", hq_state: "Colorado", quick_service: true, franchisee_cost: 25000.0)
  end

  it 'links to the edit page' do
    visit "/franchisors/#{@applebees.id}"
    click_button("Edit #{@applebees.name}")

    expect(current_path).to eq("/franchisors/#{@applebees.id}/edit")
  end

  it 'can edit the franchisor name and attributes' do
    visit "/franchisors/#{@applebees.id}"
    expect(page).to have_content("Applebees")
    expect(page).to have_content("Glendale")
    expect(page).to have_content("California")
    expect(page).to have_content("false")
    expect(page).to have_content(30000.0)

    click_button("Edit #{@applebees.name}")
    fill_in('Name', with: 'Applebees1')
    fill_in('HQ City:', with: 'Denver')
    fill_in('HQ State:', with: 'Colorado')
    page.check('Quick Service Restaurant?')
    fill_in('Franchisee Cost:', with: 27000.0)
    click_on("Update #{@applebees.name}")

    expect(current_path).to eq("/franchisors/#{@applebees.id}")
    expect(page).to have_content('Applebees1')
    expect(page).to have_content('Denver')
    expect(page).to have_content('Colorado')
    expect(page).to have_content('true')
    expect(page).to have_content(27000.0)
  end
end
