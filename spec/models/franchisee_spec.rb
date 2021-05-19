require 'rails_helper'

RSpec.describe Franchisee, type: :model do
  it {should belong_to :franchisor}

  describe 'instance methods' do
    before :each do
      @cfa = Franchisor.create!(name: "CFA", hq_city: "Atlanta", hq_state: "Georgia", quick_service: true, franchisee_cost: 10000.0)
      @cfa_littleton = @cfa.franchisees.create!(name: "CFA Littleton", city: "Littleton", state: "Colorado", independent: false, annual_sales: 425000.0, initial_fee: 10000.0, pct_fee: 0.12)
      @cfa_lakewood = @cfa.franchisees.create!(name: "CFA Lakewood", city: "Lakewood", state: "Colorado", independent: false, annual_sales: 437000.0, initial_fee: 10000.0, pct_fee: 0.13)
      @cfa_tacoma = @cfa.franchisees.create!(name: "CFA Tacoma", city: "Tacoma", state: "Washington", independent: false, annual_sales: 451000.0, initial_fee: 10000.0, pct_fee: 0.15)

      @applebees = Franchisor.create!(name: "Applebees", hq_city: "Glendale", hq_state: "California", quick_service: false, franchisee_cost: 30000.0)
      @applebees_lakewood = @applebees.franchisees.create!(name: "Applebees Lakewood", city: "Lakewood", state: "Colorado", independent: true, annual_sales: 397000.0, initial_fee: 42000.0, pct_fee: 0.07)
      @applebees_nashville = @applebees.franchisees.create!(name: "Applebees Nashville", city: "Nashville", state: "Tennessee", independent: true, annual_sales: 319000.0, initial_fee: 42000.0, pct_fee: 0.07)
      @applebees_tacoma = @applebees.franchisees.create!(name: "Applebees Tacoma", city: "Tacoma", state: "Washington", independent: false, annual_sales: 359000.0, initial_fee: 30000.0, pct_fee: 0.10)
      @applebees_steamboat = @applebees.franchisees.create!(name: "Applebees Steamboat", city: "Steamboat", state: "Colorado", independent: false, annual_sales: 336000.0, initial_fee: 30000.0, pct_fee: 0.09)
    end

    describe '#independent?' do
      it 'only shows independent franchisees' do
        expect(Franchisee.find_independent).to eq([@applebees_lakewood, @applebees_nashville])
      end
    end

    describe '#sort_alphabetically' do
      it 'alphabetizes the franchisor franchisees' do
        expect(@cfa.franchisees).to eq([@cfa_littleton, @cfa_lakewood, @cfa_tacoma])
        expect(@cfa.franchisees.sort_alphabetically).to eq([@cfa_lakewood, @cfa_littleton, @cfa_tacoma])
      end
    end

    describe '#filter_annual_sales(sales)' do
      it 'finds all that is filtered by annual sales input' do
        expect(@cfa.franchisees.filter_annual_sales(450000.0)).to eq([@cfa_tacoma])
      end
    end
  end
end
