class RecipeSuggestion < ApplicationRecord
  validates :ingredients, presence: true
end
