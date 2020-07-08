class CreateWaters < ActiveRecord::Migration[6.0]
  def change
    create_table :waters do |t|
      t.integer :weeks
      t.string :plant_family
      t.string :soil

      t.timestamps
    end
  end
end
