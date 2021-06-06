class Mission < ApplicationRecord
  enum status: { pending: 0, in_progress: 1, complete: 2 }
  validates :title, :description, :status, presence: true
  validates_uniqueness_of :title, case_sensitive: true
end
