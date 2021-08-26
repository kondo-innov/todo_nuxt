FactoryBot.define do
  factory :event_comment do
    content { 'content' }

    association :event
    association :user
  end
end
