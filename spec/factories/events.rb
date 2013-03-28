# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    startsAt "2013-03-27 20:18:13"
    endsAt "2013-03-27 20:18:13"
    title "MyString"
    color "MyString"
    conference_room_id 1
  end
end
