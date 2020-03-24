class CreatePalettes < ActiveRecord::Migration[6.0]
  def change
    create_table :palettes do |t|
      t.string :name
      t.text :image
      t.boolean :colorblind_accessible
      t.integer :user_id

      t.timestamps
    end
  end
end
