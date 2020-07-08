class CreateJournals < ActiveRecord::Migration[6.0]
  def change
    create_table :journals do |t|
      t.integer :water_id
      t.integer :plant_id
      t.integer :user_id
      t.date :date
      t.date :last_watered

      t.timestamps
    end
  end
end
