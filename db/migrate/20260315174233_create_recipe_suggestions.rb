class CreateRecipeSuggestions < ActiveRecord::Migration[8.1]
  def change
    create_table :recipe_suggestions do |t|
      t.text :ingredients
      t.text :recipe

      t.timestamps
    end
  end
end
