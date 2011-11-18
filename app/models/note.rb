class Note < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :user, :text

  attr_accessible :text, :unsolved, :category_list

  acts_as_taggable_on :categories, :retrospectives

  scope :category, lambda { |tag| tagged_with tag, :on => :categories }
  scope :retrospective, lambda { |tag| tagged_with tag, :on => :retrospectives }
end
