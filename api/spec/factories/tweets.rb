FactoryBot.define do
  factory :tweet do
    description { 'description' }
    
    association :user
  end
end