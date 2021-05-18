require 'rails_helper'

RSpec.describe 'New Franchisee Creation' do
  before :each do
    @cfa = Franchisor.create!(name: "CFA", hq_city: "Atlanta", hq_state: "Georgia", quick_service: true, franchisee_cost: 10000.0)
    @cfa_littleton = @cfa.franchisees.create!(name: "CFA Littleton", city: "Littleton", state: "Colorado", independent: false, annual_sales: 425000.0, initial_fee: 10000.0, pct_fee: 0.12)
    @cfa_lakewood = @cfa.franchisees.create!(name: "CFA Lakewood", city: "Lakewood", state: "Colorado", independent: false, annual_sales: 437000.0, initial_fee: 10000.0, pct_fee: 0.13)
    @cfa_tacoma = @cfa.franchisees.create!(name: "CFA Tacoma", city: "Tacoma", state: "Washington", independent: false, annual_sales: 451000.0, initial_fee: 10000.0, pct_fee: 0.15)
  end

  it 'links to a new page from Franchisee Index' do
    visit "/franchisors/#{@cfa.id}/franchisees"

    click_link('Create Franchisee')
    expect(current_path).to eq("/franchisors/#{@cfa.id}/franchisees/new")
  end

  it 'can create a new franchisee' do
    visit "franchisors/#{@cfa.id}/franchisees/new"

    fill_in('Name', with: 'CFA Denver')
    fill_in('City', with: 'Denver')
    fill_in('State', with: 'Colorado')
    uncheck('Independent?')
    fill_in('Annual Sales', with: 468000.0)
    fill_in('Initial Fee to HQ', with: 10000)
    fill_in('Annual Percent Fee to HQ', with: 0.12)

    click_button('Create Franchisee')

    expect(current_path).to eq("/franchisors/#{@cfa.id}/franchisees")
    expect(page).to have_content("CFA Denver")
    expect(page).to have_content("Denver")
    expect(page).to have_content("Colorado")
    expect(page).to have_content("false")
    expect(page).to have_content(468000.0)
    expect(page).to have_content(10000.0)
    expect(page).to have_content(0.12)
  end

  it 'can create a new franchisee that is independent' do
    visit "franchisors/#{@cfa.id}/franchisees/new"

    fill_in('Name', with: 'CFA Denver')
    fill_in('City', with: 'Denver')
    fill_in('State', with: 'Colorado')
    check('Independent?')
    fill_in('Annual Sales', with: 468000.0)
    fill_in('Initial Fee to HQ', with: 10000)
    fill_in('Annual Percent Fee to HQ', with: 0.12)

    click_button('Create Franchisee')
    expect(page).to have_content("true")
  end
end
