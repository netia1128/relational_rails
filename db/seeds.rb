Franchisor.destroy_all
Franchisee.destroy_all

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@cfa = Franchisor.create!(name: "Chick-Fil-A", hq_city: "Atlanta", hq_state: "Georgia", quick_service: true, franchisee_cost: 10000.0)
@cfa_littleton = @cfa.franchisees.create!(name: "CFA Littleton", city: "Littleton", state: "Colorado", independent: false, annual_sales: 425000.0, initial_fee: 10000.0, pct_fee: 0.12)
@cfa_lakewood = @cfa.franchisees.create!(name: "CFA Lakewood", city: "Lakewood", state: "Colorado", independent: false, annual_sales: 437000.0, initial_fee: 10000.0, pct_fee: 0.13)
@cfa_tacoma = @cfa.franchisees.create!(name: "CFA Tacoma", city: "Tacoma", state: "Washington", independent: false, annual_sales: 451000.0, initial_fee: 10000.0, pct_fee: 0.15)

@applebees = Franchisor.create!(name: "Applebees", hq_city: "Glendale", hq_state: "California", quick_service: false, franchisee_cost: 30000.0)
@applebees_lakewood = @applebees.franchisees.create!(name: "Applebees Lakewood", city: "Lakewood", state: "Colorado", independent: true, annual_sales: 397000.0, initial_fee: 42000.0, pct_fee: 0.07)
@applebees_tacoma = @applebees.franchisees.create!(name: "Applebees Tacoma", city: "Tacoma", state: "Washington", independent: false, annual_sales: 359000.0, initial_fee: 30000.0, pct_fee: 0.10)
@applebees_steamboat = @applebees.franchisees.create!(name: "Applebees Steamboat", city: "Steamboat", state: "Colorado", independent: false, annual_sales: 336000.0, initial_fee: 30000.0, pct_fee: 0.09)
@applebees_littleton = @applebees.franchisees.create!(name: "Applebees Littleton", city: "Littleton", state: "Colorado", independent: true, annual_sales: 326000.0, initial_fee: 42000.0, pct_fee: 0.08)

@garbanzo = Franchisor.create!(name: "Garbanzo", hq_city: "Centennial", hq_state: "Colorado", quick_service: true, franchisee_cost: 25000.0)
@garbanzo_littleton = @garbanzo.franchisees.create!(name: "Garbanzo Littleton", city: "Littleton", state: "Colorado", independent: true, annual_sales: 325000.0, initial_fee: 40000.0, pct_fee: 0.09)
@garbanzo_lakewood = @garbanzo.franchisees.create!(name: "Garbanzo Lakewood", city: "Lakewood", state: "Colorado", independent: false, annual_sales: 367000.0, initial_fee: 25000.0, pct_fee: 0.13)
@garbanzo_tacoma = @garbanzo.franchisees.create!(name: "Garbanzo Tacoma", city: "Tacoma", state: "Washington", independent: true, annual_sales: 401000.0, initial_fee: 40000.0, pct_fee: 0.10)
