json.tweets @tweets.each do |tweet|
  if tweet.user.image.present?
    json.extract! tweet, :id, :description, :user_id, :created_at
    json.name tweet.user.name
    json.image tweet.user.image.service_url
    json.picture tweet.picture.service_url
  else
    json.extract! tweet, :id, :description, :user_id, :created_at
    json.name tweet.user.name
    json.picture tweet.picture.service_url
  end
end