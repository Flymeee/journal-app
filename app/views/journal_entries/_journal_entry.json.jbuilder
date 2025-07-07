json.extract! journal_entry, :id, :title, :content, :user_id, :created_at, :updated_at
json.url journal_entry_url(journal_entry, format: :json)
