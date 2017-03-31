# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#find a name of Italian if that is first time, create it
italian   = Category.where(name: "Italian").first_or_create(name: "Italian")
asia      = Category.where(name: "Asian").first_or_create(name: "Asian")
greek     = Category.where(name: "Greek").first_or_create(name: "Greek")
french    = Category.where(name: "French").first_or_create(name: "French")
mexican   = Category.where(name: "Mexican").first_or_create(name: "Mexican")
indian    = Category.where(name: "Indian").first_or_create(name: "Indian")
korean    = Category.where(name: "Korean").first_or_create(name: "Korean")
japanese  = Category.where(name: "Japanese").first_or_create(name: "Japanese")
myanmar   = Category.where(name: "Myanmar").first_or_create(name: "Myanmar")
chinese   = Category.where(name: "Chinese").first_or_create(name: "Chinese")
vietnam   = Category.where(name: "Vietnam").first_or_create(name: "Vietnam")
american  = Category.where(name: "American").first_or_create(name: "American")
western   = Category.where(name: "Western").first_or_create(name: "Western")
