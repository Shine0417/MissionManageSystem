class User < ApplicationRecord
  has_secure_password
  has_many :mission

  validates :username, :password, presence: true
  validates_uniqueness_of :username, case_sensitive: true

  def self.authenticate(username, password)
    @user.id if find_user_by_name(username) && @user.authenticate(password)
  end

  def self.find_user_by_name(username)
    @user = User.find_by(username: username)
  end
end
