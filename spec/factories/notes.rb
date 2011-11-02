# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :note do
    user { Factory.create :user }
    text "Something someone wanted to say"
    unsolved false
  end
end
