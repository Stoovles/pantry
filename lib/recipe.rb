class Recipe

  attr_reader  :name,
               :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(ingredient, quantity)
    @ingredients_required[ingredient] = quantity
  end

  def amount_required(ingredient)
    @ingredients_required[ingredient]
  end

  def ingredients
    ingredients = @ingredients_required.keys
  end

  def total_calories
    total_calories = 0
    @ingredients_required.each do |ingredient, quantity|
      total_calories += ingredient.calories * quantity
    end
    total_calories
  end

end
