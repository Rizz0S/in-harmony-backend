class AddColorTable < ActiveRecord::Migration[6.0]
    def change
      create_table :colors do |t|
        t.string :hex
  
        t.timestamps
      end
    end
end
