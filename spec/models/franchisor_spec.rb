require 'rails_helper'

RSpec.describe Franchisor, type: :model do
  it {should have_many :franchisees}
end
