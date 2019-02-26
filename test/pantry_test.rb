require 'pry'
require './lib/recipe'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/pantry'

class PantryTest < Minitest::Test

  def test_it_exists
    pantry = Pantry.new

    assert_instance_of Pantry, pantry
  end

  def test_stock_starts_empty_hash
    pantry = Pantry.new
    expected = {}

    assert_equal expected, pantry.stock
  end

  def test_stock_check_starts_empty_for_ingredient
    pantry = Pantry.new
    mac_and_cheese = Recipe.new("Mac and Cheese")
    mac = Ingredient.new("Macaroni", "oz", 200)
    cheese = Ingredient.new("Cheese", "C", 50)
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)

    assert_equal 0, pantry.stock_check(cheese)
    assert_equal 0, pantry.stock_check(mac)
  end

  def test_it_can_accumulate_ingredients_with_restock
    pantry = Pantry.new
    mac_and_cheese = Recipe.new("Mac and Cheese")
    mac = Ingredient.new("Macaroni", "oz", 200)
    cheese = Ingredient.new("Cheese", "C", 50)
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)
    pantry.restock(cheese, 5)

    assert_equal 5, pantry.stock_check(cheese)

    pantry.restock(cheese, 10)

    assert_equal 15, pantry.stock_check(cheese)
  end

  def test_it_has_enough_ingredients_for_recipe
    pantry = Pantry.new
    mac_and_cheese = Recipe.new("Mac and Cheese")
    mac = Ingredient.new("Macaroni", "oz", 200)
    cheese = Ingredient.new("Cheese", "C", 50)
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)
    pantry.restock(cheese, 5)
    pantry.restock(cheese, 5)

    assert_equal false, pantry.enough_ingredients_for?(mac_and_cheese)

    pantry.restock(mac, 8)

    assert_equal true, pantry.enough_ingredients_for?(mac_and_cheese)
  end

end
