# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
project1 = Project.find_or_create_by!(name: "Project 1")
project2 = Project.find_or_create_by!(name: "Project 2")
project3 = Project.find_or_create_by!(name: "Project 3")

barbora = User.find_or_create_by!(name: "Barbora")
david = User.find_or_create_by!(name: "David")
mike = User.find_or_create_by!(name: "Mike")

Comment.find_or_create_by!(project: project1, user: barbora, content: "This is a comment by Barbora on Project 1")
Comment.find_or_create_by!(project: project1, user: david, content: "This is a comment by David on Project 1")
Comment.find_or_create_by!(project: project1, user: mike, content: "This is a comment by Mike on Project 1")

Comment.find_or_create_by!(project: project2, user: david, content: "Hey! How’s your day going?")
Comment.find_or_create_by!(project: project2, user: mike, content: "It’s going well! Thanks for asking. How about you? ")
Comment.find_or_create_by!(project: project2, user: david, content: "Fantastic")

Comment.find_or_create_by!(project: project3, user: barbora, content: "This is a comment by Barbora on Project 3")
Comment.find_or_create_by!(project: project3, user: david, content: "This is a comment by David on Project 3")
Comment.find_or_create_by!(project: project3, user: mike, content: "This is a comment by Mike on Project 3")
