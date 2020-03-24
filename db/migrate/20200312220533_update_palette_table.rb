class UpdatePaletteTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :palettes, :image, :text
  end
end
