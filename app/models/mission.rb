class Mission < ApplicationRecord
    validates :title, :description, presence: true
    validates_uniqueness_of :title, :case_sensitive => true
end
