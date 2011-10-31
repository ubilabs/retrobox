require 'spec_helper'

describe User do
  describe 'database' do
    it { should have_db_column(:first_name).of_type(:string) }
    it { should have_db_column(:last_name).of_type(:string) }
  end

  describe 'factory' do
    it { Factory.build(:user).should be_valid }
  end

  describe 'associations' do
    it { should have_many(:notes) }
  end
end
