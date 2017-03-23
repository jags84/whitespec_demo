# Basic Info
json.id @group_event.id
json.name @group_event.name
json.description @group_event.description
json.start_date @group_event.start_date
json.end_date @group_event.end_date
json.event_duration @group_event.event_duration
# User
json.user do
  json.email @group_event.user.email
end
# Location
json.location @group_event.location
