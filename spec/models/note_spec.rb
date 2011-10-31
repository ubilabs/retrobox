require 'spec_helper'

describe Note do
  describe 'database' do
    it { should have_db_column(:text).of_type(:string) }
    it { should have_db_column(:unsolved).of_type(:boolean) }
    it { should have_db_column(:type).of_type(:string) }
    it { should have_db_column(:user_id).of_type(:integer) }
  end

  describe 'factory' do
    it { Factory.build(:note).should be_valid }
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end
end
