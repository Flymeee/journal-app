class JournalEntry < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true

  
  validates :title, presence: true
  validates :content, presence: true
end