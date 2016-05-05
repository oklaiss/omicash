# FactoryGirl.define do
#   factory :notification do |f|
#     f.name { Faker::Name.name }
#     f.message_text { Faker::Hipster.sentence(5) }
#     f.phone_number { Faker::PhoneNumber.phone_number }
#     f.email { Faker::Internet.email }
#     f.duration 24
#     f.frequency 1
#     f.is_active true
#   end
# end