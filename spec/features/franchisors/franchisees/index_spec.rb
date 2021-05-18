require 'rails_helper'

RSpec.describe 'Franchisor franchisees index' do
  before :each do
    @cfa = Franchisor.create!(name: "CFA", hq_city: "Atlanta", hq_state: "Georgia", quick_service: true, franchisee_cost: 10000.0)
    @cfa_littleton = @cfa.franchisees.create!(name: "CFA Littleton", city: "Littleton", state: "Colorado", independent: false, annual_sales: 425000.0, initial_fee: 10000.0, pct_fee: 0.12)
    @cfa_lakewood = @cfa.franchisees.create!(name: "CFA Lakewood", city: "Lakewood", state: "Colorado", independent: false, annual_sales: 437000.0, initial_fee: 10000.0, pct_fee: 0.13)
    @cfa_tacoma = @cfa.franchisees.create!(name: "CFA Tacoma", city: "Tacoma", state: "Washington", independent: false, annual_sales: 451000.0, initial_fee: 10000.0, pct_fee: 0.15)
    @cfa_arvada = @cfa.franchisees.create!(name: "CFA Arvada", city: "Arvada", state: "Colorado", independent: false, annual_sales: 474000.0, initial_fee: 10000.0, pct_fee: 0.16)
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

  it 'links to franchisees index page' do
    visit "/franchisors/#{@cfa.id}/franchisees"
    click_on "Franchisees Index"

    expect(current_path).to eq("/franchisees")
  end

  it 'links to franchisors index page' do
    visit "/franchisors/#{@cfa.id}/franchisees"
    click_on "Franchisors Index"

    expect(current_path).to eq("/franchisors")
  end

  it 'alphabetize franchisees when clicked on' do
    visit "/franchisors/#{@cfa.id}/franchisees"
    expect(@cfa_littleton.name).to appear_before(@cfa_lakewood.name)

    click_on "Sort Alphabetical"
    expect(@cfa_lakewood.name).to appear_before(@cfa_littleton.name)
  end

  it 'links to franchisee edit page' do
    visit "/franchisors/#{@cfa.id}/franchisees"
    click_on "Update #{@cfa_lakewood.name}"

    expect(current_path).to eq("/franchisees/#{@cfa_lakewood.id}/edit")
  end
end
