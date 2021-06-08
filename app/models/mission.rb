class Mission < ApplicationRecord
  enum status: { pending: 0, in_progress: 1, complete: 2 }
  enum priority: { low: 0, medium: 1, high: 2 }
  validates :title, :description, :status, :priority, presence: true
  validates_uniqueness_of :title, case_sensitive: true

  scope :title_like, ->(title) { where('title LIKE ?', "%#{title}%") if title }
  scope :status, ->(status) { where({ status: status }) if Mission.statuses.keys.include?(status) }
end
