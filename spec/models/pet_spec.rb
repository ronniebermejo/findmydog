require 'spec_helper'

describe Pet, 'Validations' do
  it { should validate_presence_of(:name) }
end


describe Pet, 'Associations' do
  it { should belong_to(:owner).class_name('Owner') }
end
