# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Car.create([
    {name: "Camry", year: 2020, price: 25045, condition: "New", color: "Black"},
    {name: "Maxima", year: 2021, price: 37090,  condition: "New", color: "White"},
    {name: "Grand Cherokee", year:2020, price: 32150, condition: "New", color: "Burgundy"}

])







# t.string "name"
# t.integer "year"
# t.integer "price"
# t.string "condition"
# t.string "color"