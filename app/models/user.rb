class User < ApplicationRecord
  has_secure_password
  has_many :mission, dependent: :destroy

  enum role: { user: 0, admin: 1 }

  validates :username, :password, presence: true
  validates_uniqueness_of :username, case_sensitive: true

  before_destroy :prevent_last_admin_deleted

  def self.authenticate(username, password)
    @user.id if find_user_by_name(username) && @user.authenticate(password)
  end

  def self.find_user_by_name(username)
    @user = User.find_by(username: username)
  end

  protected

  def prevent_last_admin_deleted
    throw(:abort) if admin? && User.admin.count == 1
  end
end
