json.events @events.each do |event|
  if event.user.image.present?
    json.extract! event, :id, :eventname, :datetime, :cityward, :streetaddress, :description, :user_id
    json.name event.user.name
    json.image event.user.image.service_url
  else
    json.extract! event, :id, :eventname, :datetime, :cityward, :streetaddress, :description, :user_id
    json.name event.user.name
  end
end