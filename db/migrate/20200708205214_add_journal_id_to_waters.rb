class AddJournalIdToWaters < ActiveRecord::Migration[6.0]
  def change
    add_column :waters, :journal_id, :integer
  end
end
