require 'rails_helper'

RSpec.describe 'Destroy Franchisee in Franchisor Franchisee index page' do
  before :each do
    @applebees = Franchisor.create!(name: "Applebees", hq_city: "Glendale", hq_state: "California", quick_service: false, franchisee_cost: 30000.0)
    @applebees_lakewood = @applebees.franchisees.create!(name: "Applebees Lakewood", city: "Lakewood", state: "Colorado", independent: true, annual_sales: 397000.0, initial_fee: 42000.0, pct_fee: 0.07)
    @applebees_tacoma = @applebees.franchisees.create!(name: "Applebees Tacoma", city: "Tacoma", state: "Washington", independent: true, annual_sales: 359000.0, initial_fee: 30000.0, pct_fee: 0.10)
    @applebees_steamboat = @applebees.franchisees.create!(name: "Applebees Steamboat", city: "Steamboat", state: "Colorado", independent: false, annual_sales: 336000.0, initial_fee: 30000.0, pct_fee: 0.09)
  end

  it 'can delete the franchisee from franchisor franchisee index page' do
    visit "/franchisors/#{@applebees.id}/franchisees"
    click_button "Delete #{@applebees_tacoma.name}"

    expect(current_path).to eq("/franchisees")
    expect(page).to_not have_content('Applebees Tacoma')
  end
end
