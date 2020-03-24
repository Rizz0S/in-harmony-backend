class UserSerializer < ActiveModel::Serializer
    attributes :id, :username, :user_palettes, :liked_palettes

    def user_palettes
      palettesArr = self.object.palettes
      
      palettesArr.map {|palette| UserPalettesSerializer.new(palette)}
    end

    def liked_palettes
      palettesArr = self.object.liked_palettes
      
      palettesArr.map {|palette| UserPalettesSerializer.new(palette)}
    end
  end