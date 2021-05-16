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

  it 'sorts by the most recently created' do
    @garbanzo = Franchisor.create!(name: "Garbanzo", hq_city: "Centennial", hq_state: "Colorado", quick_service: true, franchisee_cost: 25000.0)
    visit ("/franchisors")

    expect(page).to have_content(@garbanzo.created_at)
    expect(page).to have_content(@applebees.created_at)
    expect(@garbanzo.name).to appear_before(@cfa.name)
    expect(@garbanzo.name).to appear_before(@applebees.name)
  end

  it 'links to franchisees index page' do
    visit "/franchisors"
    click_on "Franchisees Index"

    expect(current_path).to eq("/franchisees")
  end
end
