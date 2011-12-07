class Note < ActiveRecord::Base
  opinio_subjectum

  belongs_to :user

  validates_presence_of :user, :text

  attr_accessible :text, :unsolved

end
