FactoryBot.define do
  factory :event do
    eventname { 'eventname' }
    datetime { '2021-08-27 18:00:00' }
    cityward { '名古屋市' }
    streetaddress { '中区栄4丁目1-8' }
    description { 'description' }

    association :user

  end
end
