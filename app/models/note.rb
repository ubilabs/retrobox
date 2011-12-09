class Note < ActiveRecord::Base
  opinio_subjectum

  belongs_to :user

  validates_presence_of :user, :text

  attr_accessible :text, :unsolved, :category_list, :retrospective

  acts_as_taggable_on :categories

  scope :category, lambda { |tag| tagged_with tag, :on => :categories }
  scope :current_with_unsolved, where("unsolved = 1 or retrospective = 'current'")
  scope :current_without_unsolved, where("retrospective = 'current'")
end
