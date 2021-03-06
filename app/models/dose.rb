class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail
  validates :description, presence: true
  validates :cocktail_id, presence: true
  validates :ingredient_id, presence: true
  validates :cocktail_id, uniqueness: { scope: :ingredient_id,
    message: "One dose per ingredient and mocktail" }
end
