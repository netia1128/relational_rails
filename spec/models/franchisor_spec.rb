require 'rails_helper'

RSpec.describe Franchisor, type: :model do
  it {should have_many :franchisees}

  describe 'instance methods' do
    before :each do
      @cfa = Franchisor.create!(name: "Chick-Fil-A", hq_city: "Atlanta", hq_state: "Georgia", quick_service: true, franchisee_cost: 10000.0)
      @applebees = Franchisor.create!(name: "Applebees", hq_city: "Glendale", hq_state: "California", quick_service: false, franchisee_cost: 30000.0)
    end

    describe '#sort_by_created_desc' do
      it 'sorts by the most recently created' do
        expect(Franchisor.sort_by_created_desc.first).to eq(@applebees)
      end
    end
  #   describe '#count_franchisees' do
  #     before :each do
  #       @cfa = Franchisor.create!(name: "CFA", hq_city: "Atlanta", hq_state: "Georgia", quick_service: true, franchisee_cost: 10000.0)
  #       @cfa_littleton = @cfa.franchisees.create!(name: "CFA Littleton", city: "Littleton", state: "Colorado", independent: false, annual_sales: 425000.0, initial_fee: 10000.0, pct_fee: 0.12)
  #       @cfa_lakewood = @cfa.franchisees.create!(name: "CFA Lakewood", city: "Lakewood", state: "Colorado", independent: false, annual_sales: 437000.0, initial_fee: 10000.0, pct_fee: 0.13)
  #       @cfa_tacoma = @cfa.franchisees.create!(name: "CFA Tacoma", city: "Tacoma", state: "Washington", independent: false, annual_sales: 451000.0, initial_fee: 10000.0, pct_fee: 0.15)
  #     end
  #
  #     it 'counts the number of franchisees to this franchisor' do
  #       expect(@cfa.franchisees.count).to eq(3)
  #     end
  #   end
  end
end
