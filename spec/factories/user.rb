FactoryBot.define do

  factory :user do
    name "Evgeniy"
    email "evgeniy@mail.com"
    password "evgeniy"
    password_confirmation { password }
    admin_status true
  end
end