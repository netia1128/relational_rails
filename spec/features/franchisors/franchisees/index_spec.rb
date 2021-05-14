require 'rails_helper'

RSpec.describe 'Franchisor franchisees index' do
  before :each do
    @cfa = Franchisor.create!(name: "CFA", hq_city: "Atlanta", hq_state: "Georgia", quick_service: true, franchisee_cost: 10000.0)
    @cfa_littleton = @cfa.franchisees.create!(name: "CFA Littleton", city: "Littleton", state: "Colorado", independent: false, annual_sales: 425000.0, initial_fee: 10000.0, pct_fee: 0.12)
    @cfa_lakewood = @cfa.franchisees.create!(name: "CFA Lakewood", city: "Lakewood", state: "Colorado", independent: false, annual_sales: 437000.0, initial_fee: 10000.0, pct_fee: 0.13)
    @cfa_tacoma = @cfa.franchisees.create!(name: "CFA Tacoma", city: "Tacoma", state: "Washington", independent: false, annual_sales: 451000.0, initial_fee: 10000.0, pct_fee: 0.15)
  end

  it 'shows all of the names of the franchisees for the franchisor' do
    visit "/franchisors/#{@cfa.id}/franchisees"

    expect(page).to have_content(@cfa_littleton.name)
    expect(page).to have_content(@cfa_lakewood.name)
    expect(page).to have_content(@cfa_tacoma.name)

    expect(page).to have_content(@cfa_littleton.annual_sales)
    expect(page).to have_content(@cfa_lakewood.annual_sales)
    expect(page).to have_content(@cfa_tacoma.annual_sales)
  end
end
