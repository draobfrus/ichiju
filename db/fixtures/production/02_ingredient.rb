require "csv"

csv = CSV.read('db/fixtures/production/ingredients.csv')
csv.each do |ingredient|
  id = ingredient[0]
  name = ingredient[1]
  classification = ingredient[2].to_i

  Ingredient.seed(:id) do |s|
    s.id = id
    s.name = name
    s.classification = classification
  end
end
