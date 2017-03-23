json.group_events(@group_events) do |event|
  # Basic Info
  json.id event.id
  json.name event.name
  json.description event.description
  json.start_date event.start_date
  json.end_date event.end_date
  json.event_duration event.event_duration
  # User
  json.user do
    json.email event.user.email
  end
  # Location
  json.location event.location
end
