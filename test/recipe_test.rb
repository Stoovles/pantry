require 'pry'
require './lib/recipe'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'

class RecipeTest < Minitest::Test

  def test_it_exists
    mac_and_cheese = Recipe.new("Mac and Cheese")

    assert_instance_of Recipe, mac_and_cheese
  end

  def test_it_has_attributes
    mac_and_cheese = Recipe.new("Mac and Cheese")

    assert_equal "Mac and Cheese", mac_and_cheese.name
  end

  def test_ingredients_required_starts_empty_hash
    mac_and_cheese = Recipe.new("Mac and Cheese")
    expected = {}

    assert_equal expected, mac_and_cheese.ingredients_required
  end

  def test_it_can_add_ingredients_to_ingredients_required
    mac_and_cheese = Recipe.new("Mac and Cheese")
    mac = Ingredient.new("Macaroni", "oz", 30)
    cheese = Ingredient.new("Cheese", "C", 100)
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)

    expected = {
      cheese => 2,
      mac => 8
    }

    assert_equal expected, mac_and_cheese.ingredients_required
  end

  def test_it_can_return_amount_required_of_ingredient
    mac_and_cheese = Recipe.new("Mac and Cheese")
    mac = Ingredient.new("Macaroni", "oz", 30)
    cheese = Ingredient.new("Cheese", "C", 100)
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)

    assert_equal 2, mac_and_cheese.amount_required(cheese)
    assert_equal 8, mac_and_cheese.amount_required(mac)
  end

  def test_it_can_return_ingredients
    mac_and_cheese = Recipe.new("Mac and Cheese")
    mac = Ingredient.new("Macaroni", "oz", 30)
    cheese = Ingredient.new("Cheese", "C", 100)
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)

    assert_equal [cheese, mac], mac_and_cheese.ingredients
  end

  def test_it_can_return_total_calories
    mac_and_cheese = Recipe.new("Mac and Cheese")
    mac = Ingredient.new("Macaroni", "oz", 30)
    cheese = Ingredient.new("Cheese", "C", 100)
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)

    assert_equal 440, mac_and_cheese.total_calories
  end
end
