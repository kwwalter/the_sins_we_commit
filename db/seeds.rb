# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# this will look up the user if possible, and if that returns nil, it'll create
# way to maintain some integrity in our apps.
new_user = User.find_or_initialize_by(email: "joeschmo@joe.co")

new_user.update(password: "i<3potatoes")

# can use create here since there's nothing weird with passwords now
new_transgression = Transgression.find_or_create_by(description: "I can't stop sniffing other people's hair", sin_type: "Lust", sinner: new_user)

new_confession = new_transgression.confessions.create(description: "Creeped up behind someone on the subway.")

# use faker to create fake user data 
