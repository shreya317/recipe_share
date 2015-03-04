# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Test User
require "Date"

test_user = User.create!(	first_name: "Shreya", 
													last_name: "Patel",
													email: "test@gmail.com",
													password: "qaz" )


# Test Recipes

# Recipe.create!( title: "Chocolate Cake",
# 								user_id: test_user,
# 								date_posted: Date.today,
# 								description: "The best chocolatey cake ever",
# 								ingredients: "flour, cocoa, baking soda",
# 								directions: "Pour, mix, bake")
