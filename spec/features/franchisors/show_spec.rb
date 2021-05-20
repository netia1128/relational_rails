require 'rails_helper'

RSpec.describe 'Franchisors show page' do
  before :each do
    @cfa = Franchisor.create!(name: "Chick-Fil-A", hq_city: "Atlanta", hq_state: "Georgia", quick_service: true, franchisee_cost: 10000.0)
    @cfa_littleton = @cfa.franchisees.create!(name: "CFA Littleton", city: "Littleton", state: "Colorado", independent: false, annual_sales: 425000.0, initial_fee: 10000.0, pct_fee: 0.12)
    @cfa_lakewood = @cfa.franchisees.create!(name: "CFA Lakewood", city: "Lakewood", state: "Colorado", independent: false, annual_sales: 437000.0, initial_fee: 10000.0, pct_fee: 0.13)
    @cfa_tacoma = @cfa.franchisees.create!(name: "CFA Tacoma", city: "Tacoma", state: "Washington", independent: false, annual_sales: 451000.0, initial_fee: 10000.0, pct_fee: 0.15)

    @applebees = Franchisor.create!(name: "Applebees", hq_city: "Glendale", hq_state: "California", quick_service: false, franchisee_cost: 30000.0)
  end

  it 'shows a specific franchisor and its attributes' do
    visit "/franchisors/#{@cfa.id}"

    expect(page).to have_content(@cfa.name)
    expect(page).to have_content(@cfa.hq_city)
    expect(page).to have_content(@cfa.hq_state)
    expect(page).to have_content(@cfa.quick_service)
    expect(page).to have_content(@cfa.franchisee_cost)
    expect(page).to have_content(@cfa.count_franchisees)
    expect(page).to have_content(@cfa.created_at.strftime('%Y-%m-%d'))
    expect(page).to have_content(@cfa.updated_at.strftime('%Y-%m-%d'))
  end

  it 'shows a specific franchisor and its attributes' do
    visit "/franchisors/#{@applebees.id}"

    expect(page).to have_content(@applebees.name)
    expect(page).to have_content(@applebees.hq_city)
    expect(page).to have_content(@applebees.hq_state)
    expect(page).to have_content(@applebees.quick_service)
    expect(page).to have_content(@applebees.franchisee_cost)
    expect(page).to have_content(@applebees.count_franchisees)
    expect(page).to have_content(@applebees.created_at.strftime('%Y-%m-%d'))
    expect(page).to have_content(@applebees.updated_at.strftime('%Y-%m-%d'))
  end

  it 'links to franchisees index page' do
    visit "/franchisors/#{@cfa.id}"
    click_on "Franchisees"

    expect(current_path).to eq("/franchisees")
  end

  it 'links to franchisors index page' do
    visit "/franchisors/#{@cfa.id}"
    click_on "Franchisors"

    expect(current_path).to eq("/franchisors")
  end

  it 'links to franchisor franchisees page' do
    visit "/franchisors/#{@cfa.id}"
    click_on "List of Franchisees"

    expect(current_path).to eq("/franchisors/#{@cfa.id}/franchisees")
  end
end
