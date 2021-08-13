json.tweets @tweets.each do |tweet|
  json.extract! tweet, :id, :description, :user_id, :created_at
  json.name tweet.user.name
  json.picture tweet.picture.service_url
  json.comment tweet.tweet_comments
  if tweet.user.image.present?
    json.image tweet.user.image.service_url
  end
end