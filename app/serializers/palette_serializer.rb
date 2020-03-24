class PaletteSerializer < ActiveModel::Serializer
    attributes :id, :name, :colorblind_accessible, :color_hexes, :num_likes, :user_id, :username
  
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