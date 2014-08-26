require 'spec_helper'

describe User do

  subject(:user)  { create(:user) }
  it { should respond_to(:email)}
  it { should respond_to(:password)}
  it { should respond_to(:password_confirmation)}

  it { should be_valid }

end
