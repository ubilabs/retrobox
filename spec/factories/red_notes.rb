# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :red_note do
    text "Something the user doesn't like."
    unsolved false
  end
end
