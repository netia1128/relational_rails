require 'rails_helper'

RSpec.describe B1Permit, type: :model do
  it {should belong_to :b3_facility}
end