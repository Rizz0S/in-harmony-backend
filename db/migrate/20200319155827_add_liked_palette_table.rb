class AddLikedPaletteTable < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :palette_id

      t.timestamps
    end
  end
end
