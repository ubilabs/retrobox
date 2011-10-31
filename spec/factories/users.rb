# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email 'example@ubilabs.net'
    password 'somerandomthing'
    first_name 'John'
    last_name 'Doe'
  end
end
