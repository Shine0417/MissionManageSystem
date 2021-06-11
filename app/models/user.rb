class User < ApplicationRecord
    has_secure_password
    has_many :mission

    validates :username, :password, presence: true
    validates_uniqueness_of :username, case_sensitive: true
end
