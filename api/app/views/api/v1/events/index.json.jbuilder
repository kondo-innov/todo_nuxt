json.events @events.each do |event|
  json.extract! event, :id, :eventname, :datetime, :cityward, :streetaddress, :description, :user_id
  json.name event.user.name
  json.comment event.event_comments
  json.image event.user.image.service_url if event.user.image.present?
end
