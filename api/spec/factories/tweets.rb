FactoryBot.define do
  factory :tweet do
    sequence(:description) { |n| "TEST_DESCRIPTION#{n}" }

    association :user
  end
end