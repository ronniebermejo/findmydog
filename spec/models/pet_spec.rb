require 'spec_helper'

describe Pet, 'Validations' do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:owner) }
  it { should validate_presence_of(:image) }
  it { should validate_presence_of(:comments) }
  it { should validate_presence_of(:animal_category) }
end


describe Pet, 'Associations' do
  it { should belong_to(:owner).class_name('Owner') }
end
