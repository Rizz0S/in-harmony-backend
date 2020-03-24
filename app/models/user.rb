class User < ApplicationRecord
    has_many :palettes
  
    has_many :likes
    has_many :liked_palettes, through: :likes, source: :palette

    has_secure_password
    validates :username, presence: true
    validates :username, uniqueness: true

    def add_like(palette)
      self.liked_palettes << palette
    end

    def remove_like(palette)
      self.liked_palettes.delete(palette)
    end

  end