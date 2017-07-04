require 'rails_helper'

RSpec.describe Employee, type: :model do
  it { should belong_to(:department) }
  it { should validate_uniqueness_of(:mobile) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:mobile) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:department_id) }
  it { should validate_numericality_of(:mobile) }
  it { should validate_numericality_of(:department_id) }
end
