require 'json'
require 'open-uri'

puts 'Cleaning database...'
Cocktail.destroy_all

url = 'https://raw.githubusercontent.com/teijo/iba-cocktails/master/recipes.json'
cocktails_serialized = open(url).read
cocktails = JSON.parse(cocktails_serialized)

cocktails.first(10).each do |cocktail|
  Cocktail.create(name: cocktail["name"])
  # c = Cocktail.new(name: cocktail["name"])
  # c.save
end

puts 'Cleaning database...'
Ingredient.destroy_all

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

ingredients['drinks'].each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end
