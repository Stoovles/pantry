class Pantry

  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end


  def restock(ingredient, quantity)
    @stock[ingredient] += quantity
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def enough_ingredients_for?(recipe)
    ingredient_names = recipe.ingredients.map {|ingredient| ingredient.name}
    stock_names = @stock.keys.map {|ingredient| ingredient.name}
    if ingredient_names.sort != stock_names.sort
      false
    elsif holder = @stock.all? do |ingredient, quantity|
      quantity >= recipe.ingredients_required[ingredient]
      end
      holder
    else false
    end
  end

end
