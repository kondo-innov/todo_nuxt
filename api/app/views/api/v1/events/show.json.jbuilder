json.events @event.each do |event|
  json.extract! event, :id, :eventname, :datetime, :cityward, :streetaddress, :description, :user_id
  json.name event.user.name
  json.image_url event.user.image.service_url
end