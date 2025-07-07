class AddCategoryRefToJournalEntries < ActiveRecord::Migration[8.0]
  def change
    add_reference :journal_entries, :category, null: false, foreign_key: true
  end
end
