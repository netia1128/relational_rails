require 'rails_helper'

RSpec.describe 'Franchisors name page' do
  before :each do
    @cfa = Franchisor.create!(name: "Chick-Fil-A", hq_city: "Atlanta", hq_state: "Georgia", quick_service: true, franchisee_cost: 10000.0)
    @applebees = Franchisor.create!(name: "Applebees", hq_city: "Glendale", hq_state: "California", quick_service: false, franchisee_cost: 30000.0)
  end

  it 'shows all of the names of the franchisors' do
    visit "/franchisors"

    expect(page).to have_content(@cfa.name)
    expect(page).to have_content(@applebees.name)
  end

  it 'shows all of the names of the franchisors' do
    visit "/franchisors/1"

    expect(page).to have_content(@cfa.name)
    expect(page).to have_content(@cfa.quick_services)
  end
end
