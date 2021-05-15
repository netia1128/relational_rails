require 'rails_helper'

RSpec.describe Franchisee, type: :model do
  it {should belong_to :franchisor}
end
