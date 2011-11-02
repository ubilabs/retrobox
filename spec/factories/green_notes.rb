# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :green_note do
    user { Factory.create :user }
    text "Something the user really likes."
    unsolved false
  end
end
