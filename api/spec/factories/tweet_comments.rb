FactoryBot.define do
  factory :tweet_comment do
    content { 'content' }

    association :tweet
    association :user
  end
end
