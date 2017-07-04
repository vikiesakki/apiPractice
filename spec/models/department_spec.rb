require 'rails_helper'

RSpec.describe Department, type: :model do
  it { should have_many(:employees) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:created_by) }
end
