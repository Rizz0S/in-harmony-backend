class UserPalettesSerializer < ActiveModel::Serializer
    attributes :id, :name, :colorblind_accessible, :color_hexes
  
    def color_hexes
      colorsArr = self.object.colors

      colorsArr.map {|color| color.hex}
    end

  end