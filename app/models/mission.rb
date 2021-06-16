class Mission < ApplicationRecord
  belongs_to :user

  has_and_belongs_to_many :tags

  enum status: { pending: 0, in_progress: 1, complete: 2 }
  enum priority: { low: 0, medium: 1, high: 2 }
  validates :title, :description, :status, :priority, presence: true
  validates_uniqueness_of :title, case_sensitive: true

  scope :title_like, ->(title) { where('title LIKE ?', "%#{title}%") if title }
  scope :status, ->(status) { where({ status: status }) if Mission.statuses.keys.include?(status) }
  scope :tag, ->(tag_param) { includes(:missions_tags).where(tags: { name: tag_param.split(' ') }).references(:missions_tags) if tag_param.present? }

  # getter
  def tag_list
    tags.map(&:name).join(' ')
  end

  # setter
  def tag_list=(tag_names)
    self.tags = tag_names.split(' ').map { |tag| Tag.where(name: tag).first_or_create } if tag_names
  end
end
