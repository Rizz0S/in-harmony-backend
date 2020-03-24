class Palette < ApplicationRecord
    belongs_to :user
    
    has_many :palette_colors
    has_many :colors, through: :palette_colors

    has_many :likes
    has_many :liked_palettes, through: :likes, source: :user
  end
  