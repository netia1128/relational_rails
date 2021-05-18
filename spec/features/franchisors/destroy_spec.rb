require 'rails_helper'

RSpec.describe 'Destroy Franchisor' do
  before :each do
    @cfa = Franchisor.create!(name: "Chick-Fil-A", hq_city: "Atlanta", hq_state: "Georgia", quick_service: true, franchisee_cost: 10000.0)
    @applebees = Franchisor.create!(name: "Applebees", hq_city: "Glendale", hq_state: "California", quick_service: false, franchisee_cost: 30000.0)
    # @garbanzo = Franchisor.create!(name: "Garbanzo", hq_city: "Centennial", hq_state: "Colorado", quick_service: true, franchisee_cost: 25000.0)
  end

  it 'can delete the franchisor from index page' do
    @garbanzo = Franchisor.create!(name: "Garbanzo", hq_city: "Centennial", hq_state: "Colorado", quick_service: true, franchisee_cost: 25000.0)
    visit '/franchisors'
    click_button "Delete #{@garbanzo.name}"
    expect(current_path).to eq('/franchisors')
    expect(page).to_not have_content('Garbanzo')
  end
end
