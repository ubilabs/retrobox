# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :note do
    text "Something someone wanted to say"
    unsolved false
  end
end
