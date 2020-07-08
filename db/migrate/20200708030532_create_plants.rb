class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :characteristics
      t.string :light
      t.integer :difficulty

      t.timestamps
    end
  end
end
