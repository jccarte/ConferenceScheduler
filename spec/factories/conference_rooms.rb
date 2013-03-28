# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :conference_room do
    capacity 1
    building "MyString"
    vtc false
    name "MyString"
  end
end
