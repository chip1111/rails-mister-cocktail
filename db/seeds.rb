# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

all_ingredients = open(url).read
result = JSON.parse(all_ingredients)

Ingredient.delete_all

result["drinks"].each do |ingredient|
  Ingredient.create(name: "#{ingredient["strIngredient1"]}")
end
