class AddTypeOfMealToMeal < ActiveRecord::Migration
  def change
    add_column :meals, :type_of_meal, :string
  end
end
