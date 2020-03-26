class UserPalettesSerializer < ActiveModel::Serializer
    attributes :id, :name, :colorblind_accessible, :max_contrast, :color_hexes, :num_likes, :username
  
    def username
      self.object.user.username
    end

    def color_hexes
      colorsArr = self.object.colors

      colorsArr.map {|color| color.hex}
    end

    def num_likes
      self.object.likes.length
    end

  end