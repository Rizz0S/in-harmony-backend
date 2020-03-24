class CreatePaletteColorJoiner < ActiveRecord::Migration[6.0]
  def change
    create_table :palette_color_joiners do |t|
          t.integer :color_id
          t.integer :palette_id
    
          t.timestamps
      end
  end
end
