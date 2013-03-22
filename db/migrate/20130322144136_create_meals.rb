class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name
      t.timestamp :date

      t.timestamps
    end
  end
end
