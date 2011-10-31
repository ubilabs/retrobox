# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :note do
    text "MyString"
    unsolved false
    type ""
    user nil
  end
end
