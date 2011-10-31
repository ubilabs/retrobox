require 'spec_helper'

describe GreenNote do
  describe 'factory' do
    it { Factory.build(:green_note).should be_valid }
  end
end
