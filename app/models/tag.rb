class Tag < ApplicationRecord
    has_and_belongs_to_many :missions

    validates :name, presence: true
    validates_uniqueness_of :name, case_sensitive: true
end
