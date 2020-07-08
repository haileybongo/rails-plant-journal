class AddJournalIdToPlants < ActiveRecord::Migration[6.0]
  def change
    add_column :plants, :journal_id, :integer
  end
end
