class CookBook

  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def summary
    summary = []
    @recipes.each do |recipe|
      summary << create_summary(recipe)
    end
    summary
  end

  def create_summary(recipe)
    summary_hash = {}
    summary_hash[:name] = recipe.name
    hash = {}
    summary_hash[:details] = create_details_summary(recipe)
    summary_hash
  end

  def create_details_summary(recipe)
    details_hash = {}
    details_hash[:ingredients] = create_ingredients_summary(recipe)
    details_hash[:total_calories] = recipe.total_calories
    details_hash
  end

  def create_ingredients_summary(recipe)
    ingredients_summary = []
    ingredients = {}
    recipe.ingredients_required.each do |ingredient, quantity|
      ingredients = {}
      ingredients[:ingredient] = ingredient.name
      ingredients[:amount] = "#{quantity} #{ingredient.unit}"
      ingredients_summary << ingredients
    end
    ingredients_summary
  end

end
