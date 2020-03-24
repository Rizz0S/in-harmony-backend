class RenamePaletteColorTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :palette_color_joiners, :palette_colors
  end
end
