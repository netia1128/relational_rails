require 'rails_helper'

RSpec.describe 'Franchisees show page' do
  before :each do
    @cfa = Franchisor.create!(name: "CFA", hq_city: "Atlanta", hq_state: "Georgia", quick_service: true, franchisee_cost: 10000.0)
    @cfa_littleton = @cfa.franchisees.create!(name: "CFA Littleton", city: "Littleton", state: "Colorado", independent: false, annual_sales: 425000.0, initial_fee: 10000.0, pct_fee: 0.12)
    @cfa_lakewood = @cfa.franchisees.create!(name: "CFA Lakewood", city: "Lakewood", state: "Colorado", independent: false, annual_sales: 437000.0, initial_fee: 10000.0, pct_fee: 0.13)
    @cfa_tacoma = @cfa.franchisees.create!(name: "CFA Tacoma", city: "Tacoma", state: "Washington", independent: false, annual_sales: 451000.0, initial_fee: 10000.0, pct_fee: 0.15)

    @applebees = Franchisor.create!(name: "Applebees", hq_city: "Glendale", hq_state: "California", quick_service: false, franchisee_cost: 30000.0)
    @applebees_lakewood = @applebees.franchisees.create!(name: "Applebees Lakewood", city: "Lakewood", state: "Colorado", independent: true, annual_sales: 397000.0, initial_fee: 42000.0, pct_fee: 0.07)
    @applebees_tacoma = @applebees.franchisees.create!(name: "Applebees Tacoma", city: "Tacoma", state: "Washington", independent: false, annual_sales: 359000.0, initial_fee: 30000.0, pct_fee: 0.10)
    @applebees_steamboat = @applebees.franchisees.create!(name: "Applebees Steamboat", city: "Steamboat", state: "Colorado", independent: false, annual_sales: 336000.0, initial_fee: 30000.0, pct_fee: 0.09)
  end

  it 'shows a specific franchisee and its attributes' do
    visit "/franchisees/#{@cfa_littleton.id}"

    expect(page).to have_content(@cfa_littleton.name)
    expect(page).to have_content(@cfa_littleton.city)
    expect(page).to have_content(@cfa_littleton.state)
    expect(page).to have_content(@cfa_littleton.independent)
    expect(page).to have_content(@cfa_littleton.annual_sales)
    expect(page).to have_content(@cfa_littleton.initial_fee)
    expect(page).to have_content(@cfa_littleton.pct_fee * 100)
    expect(page).to have_content(@cfa_littleton.franchisor.name)
    expect(page).to have_content(@cfa_littleton.created_at.strftime('%Y-%m-%d'))
    expect(page).to have_content(@cfa_littleton.updated_at.strftime('%Y-%m-%d'))
  end

  it 'shows another specific franchisee and its attributes' do
    visit "/franchisees/#{@applebees_steamboat.id}"

    expect(page).to have_content(@applebees_steamboat.name)
    expect(page).to have_content(@applebees_steamboat.city)
    expect(page).to have_content(@applebees_steamboat.state)
    expect(page).to have_content(@applebees_steamboat.independent)
    expect(page).to have_content(@applebees_steamboat.annual_sales)
    expect(page).to have_content(@applebees_steamboat.initial_fee)
    expect(page).to have_content(@applebees_steamboat.pct_fee * 100)
    expect(page).to have_content(@applebees_steamboat.franchisor.name)
    expect(page).to have_content(@applebees_steamboat.created_at.strftime('%Y-%m-%d'))
    expect(page).to have_content(@applebees_steamboat.updated_at.strftime('%Y-%m-%d'))
  end

  it 'links to franchisees index page' do
    visit "/franchisees/#{@cfa_littleton.id}"
    click_on "Franchisees"

    expect(current_path).to eq("/franchisees")
  end

  it 'links to franchisors index page' do
    visit "/franchisees/#{@cfa_littleton.id}"
    click_on "Franchisors"

    expect(current_path).to eq("/franchisors")
  end
end
