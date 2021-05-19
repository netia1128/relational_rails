require 'rails_helper'

RSpec.describe 'The Franchisee Edit' do
  before :each do
    @applebees = Franchisor.create!(name: "Applebees", hq_city: "Glendale", hq_state: "California", quick_service: false, franchisee_cost: 30000.0)
    @applebees_lakewood = @applebees.franchisees.create!(name: "Applebees Lakewood", city: "Lakewood", state: "Colorado", independent: true, annual_sales: 397000.0, initial_fee: 42000.0, pct_fee: 0.07)
  end

  it 'links to franchisee edit page' do
    visit "/franchisees/#{@applebees_lakewood.id}"
    click_button "Update #{@applebees_lakewood.name}"

    expect(current_path).to eq("/franchisees/#{@applebees_lakewood.id}/edit")
  end

  it 'can edit the franchisee' do
    visit "/franchisees/#{@applebees_lakewood.id}"
    expect(page).to have_content("Applebees Lakewood")
    expect(page).to have_content("Lakewood")
    expect(page).to have_content("Colorado")
    expect(page).to have_content("true")
    expect(page).to have_content(397000.0)
    expect(page).to have_content(42000.0)
    expect(page).to have_content(7.0)

    click_button("Update #{@applebees_lakewood.name}")
    fill_in('Name', with: 'Applebees Nashville')
    fill_in('City:', with: 'Nashville')
    fill_in('State:', with: 'Tennessee')
    uncheck('Independent?')
    fill_in('Annual Sales:', with: 339000.0)
    fill_in('Initial Fee to Franchisor:', with: 30000.0)
    fill_in('Annual Percent Fee to Franchisor:', with: 0.09)
    click_on("Update #{@applebees_lakewood.name}")

    expect(current_path).to eq("/franchisees/#{@applebees_lakewood.id}")
    expect(page).to have_content('Applebees Nashville')
    expect(page).to have_content('Nashville')
    expect(page).to have_content('Tennessee')
    expect(page).to have_content('false')
    expect(page).to have_content(339000.0)
    expect(page).to have_content(30000.0)
    expect(page).to have_content(9.0)
  end
end
