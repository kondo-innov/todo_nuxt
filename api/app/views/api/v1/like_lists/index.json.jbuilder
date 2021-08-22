json.tweets @tweets.each do |tweet|
  json.extract! tweet, :id, :description, :user_id, :created_at
  json.name tweet.user.name
  json.picture tweet.picture.service_url
  json.comment tweet.tweet_comments
  json.like tweet.likes
  json.image tweet.user.image.service_url if tweet.user.image.present?
end
