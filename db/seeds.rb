# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Delete Records
GroupEvent.delete_all
User.delete_all

# Generate 3 Random users
User.create(email: 'user1@whitespectre.com')
User.create(email: 'user2@whitespectre.com')
User.create(email: 'user3@whitespectre.com')

# Generate 5 GroupEvent
GroupEvent.create(user: User.order("RANDOM()").limit(1).first, name: "Event 1", description: "Description 1", start_date: DateTime.now, end_date: DateTime.now + 10.days, publish_status:'published',latitude: 10.44 ,longitude: -66.09)

GroupEvent.create(user: User.order("RANDOM()").limit(1).first, name: "Event 2", description: "Description 2", start_date: DateTime.now, end_date: DateTime.now + 12.days, publish_status:'published',latitude: 10.44 ,longitude: -66.09)

GroupEvent.create(user: User.order("RANDOM()").limit(1).first, name: "Event 3", description: "Description 3", start_date: DateTime.now, end_date: DateTime.now + 15.days, publish_status:'draft',latitude: 10.44 ,longitude: -66.09)

GroupEvent.create(user: User.order("RANDOM()").limit(1).first, name: "Event 4", description: "Description 4", start_date: DateTime.now, end_date: DateTime.now + 18.days, publish_status:'published',latitude: 10.44 ,longitude: -66.09)

GroupEvent.create(user: User.order("RANDOM()").limit(1).first, name: "Event 5", description: "Description 5", start_date: DateTime.now, end_date: DateTime.now + 3.days, publish_status:'draft',latitude: 10.44 ,longitude: -66.09)
