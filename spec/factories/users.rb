# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "example_#{n}@ubilabs.net" }
    password 'somerandomthing'
    first_name 'John'
    last_name 'Doe'
  end
end
