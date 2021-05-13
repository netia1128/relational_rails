require 'rails_helper'

RSpec.describe 'Franchisors show page' do
  before :each do
    @cfa = Franchisor.create!(name: "Chick-Fil-A", hq_city: "Atlanta", hq_state: "Georgia", quick_service: true, franchisee_cost: 10000.0)
    @applebees = Franchisor.create!(name: "Applebees", hq_city: "Glendale", hq_state: "California", quick_service: false, franchisee_cost: 30000.0)
  end

  it 'shows a specific franchisor and its attributes' do
    visit "/franchisors/#{@cfa.id}"

    expect(page).to have_content(@cfa.name)
    expect(page).to have_content(@cfa.quick_service)
  end

  it 'shows a specific franchisor and its attributes' do
    visit "/franchisors/#{@applebees.id}"

    expect(page).to have_content(@applebees.name)
    expect(page).to have_content(@applebees.franchisee_cost)
  end
end
