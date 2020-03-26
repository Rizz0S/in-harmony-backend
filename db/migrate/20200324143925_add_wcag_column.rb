class AddWcagColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :palettes, :max_contrast, :float
  end
end
