require 'rails_helper'

RSpec.describe 'Destroy Franchisee' do
  before :each do
    @cfa = Franchisor.create!(name: "CFA", hq_city: "Atlanta", hq_state: "Georgia", quick_service: true, franchisee_cost: 10000.0)
    @cfa_littleton = @cfa.franchisees.create!(name: "CFA Littleton", city: "Littleton", state: "Colorado", independent: false, annual_sales: 425000.0, initial_fee: 10000.0, pct_fee: 0.12)
    @cfa_lakewood = @cfa.franchisees.create!(name: "CFA Lakewood", city: "Lakewood", state: "Colorado", independent: false, annual_sales: 437000.0, initial_fee: 10000.0, pct_fee: 0.13)
    @cfa_tacoma = @cfa.franchisees.create!(name: "CFA Tacoma", city: "Tacoma", state: "Washington", independent: false, annual_sales: 451000.0, initial_fee: 10000.0, pct_fee: 0.15)

    @applebees = Franchisor.create!(name: "Applebees", hq_city: "Glendale", hq_state: "California", quick_service: false, franchisee_cost: 30000.0)
    @applebees_lakewood = @applebees.franchisees.create!(name: "Applebees Lakewood", city: "Lakewood", state: "Colorado", independent: true, annual_sales: 397000.0, initial_fee: 42000.0, pct_fee: 0.07)
    @applebees_tacoma = @applebees.franchisees.create!(name: "Applebees Tacoma", city: "Tacoma", state: "Washington", independent: true, annual_sales: 359000.0, initial_fee: 30000.0, pct_fee: 0.10)
    @applebees_steamboat = @applebees.franchisees.create!(name: "Applebees Steamboat", city: "Steamboat", state: "Colorado", independent: false, annual_sales: 336000.0, initial_fee: 30000.0, pct_fee: 0.09)
  end

  it 'can delete the franchisee from show page' do
    visit "/franchisees/#{@applebees_tacoma.id}"
    click_button "Delete #{@applebees_tacoma.name}"

    expect(current_path).to eq("/franchisees")
    expect(page).to_not have_content('Applebees Tacoma')
  end

  it 'can delete the franchisee from index page' do
    visit "/franchisees"
    click_button "Delete #{@applebees_tacoma.name}"

    expect(current_path).to eq("/franchisees")
    expect(page).to_not have_content('Applebees Tacoma')
  end
end
