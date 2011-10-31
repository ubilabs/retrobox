require 'spec_helper'

describe RedNote do
  describe 'factory' do
    it { Factory.build(:red_note).should be_valid }
  end
end
