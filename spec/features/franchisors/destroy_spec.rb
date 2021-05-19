require 'rails_helper'

RSpec.describe 'Destroy Franchisor' do
  before :each do
    @cfa = Franchisor.create!(name: "Chick-Fil-A", hq_city: "Atlanta", hq_state: "Georgia", quick_service: true, franchisee_cost: 10000.0)
    @applebees = Franchisor.create!(name: "Applebees", hq_city: "Glendale", hq_state: "California", quick_service: false, franchisee_cost: 30000.0)
    @garbanzo = Franchisor.create!(name: "Garbanzo", hq_city: "Centennial", hq_state: "Colorado", quick_service: true, franchisee_cost: 25000.0)
    @garbanzo_lakewood = @garbanzo.franchisees.create!(name: "Garbanzo Lakewood", city: "Lakewood", state: "Colorado", independent: false, annual_sales: 367000.0, initial_fee: 25000.0, pct_fee: 0.13)
  end

  it 'can delete the franchisor from show page' do
    visit "/franchisors/#{@garbanzo.id}"
    click_button "Delete #{@garbanzo.name}"

    expect(current_path).to eq('/franchisors')
    expect(page).to_not have_content('Garbanzo')
  end

  it 'can delete the franchisor from index page' do
    visit '/franchisors'
  end

  it 'can delete the franchisor from show page' do
    visit "/franchisors/#{@garbanzo.id}"
    click_button "Delete #{@garbanzo.name}"

    expect(current_path).to eq('/franchisors')
    expect(page).to_not have_content('Garbanzo')

    visit '/franchisees'

    expect(page).to_not have_content('Garbanzo Lakewood')
  end

  # it 'can delete the franchisor from index page' do
  #   @garbanzo = Franchisor.create!(name: "Garbanzo", hq_city: "Centennial", hq_state: "Colorado", quick_service: true, franchisee_cost: 25000.0)
  #   visit '/franchisors'
  #   click_button "Delete #{@garbanzo.name}"
  #   expect(current_path).to eq('/franchisors')
  #   expect(page).to_not have_content('Garbanzo')
  # end
end
