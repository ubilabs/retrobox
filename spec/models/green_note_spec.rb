require 'spec_helper'

describe GreenNote do
  describe 'factory' do
    it { Factory.build(:green_note).should be_valid }
  end

  describe 'categories' do
    it 'should be taggable with categories' do
      note = Factory.create(:green_note)

      note.category_list = 'test1, test2'
      note.save!

      notes = note.categories.collect &:name
      notes.should include 'test1'
      notes.should include 'test2'
      notes.should_not include 'test3'
    end
  end
end
