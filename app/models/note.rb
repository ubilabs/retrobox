class Note < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :user, :text

  attr_accessible :text, :unsolved, :category_list

  acts_as_taggable_on :categories
end
