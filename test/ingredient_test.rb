require 'pry'
require './lib/ingredient'
require 'minitest/autorun'
require 'minitest/pride'

class IngredientTest < Minitest::Test

  def test_it_exists
    cheese = Ingredient.new("Cheese", "oz", 50)

    assert_instance_of Ingredient, cheese
  end

  def test_it_has_attributes
    cheese = Ingredient.new("Cheese", "oz", 50)

    assert_equal "Cheese", cheese.name
    assert_equal "oz", cheese.unit
    assert_equal 50, cheese.calories
  end

end
