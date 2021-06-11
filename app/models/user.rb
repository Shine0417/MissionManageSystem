class User < ApplicationRecord
  has_secure_password
  has_many :mission

  validates :username, :password, presence: true
  validates_uniqueness_of :username, case_sensitive: true

  def self.authenticate(params)
    return @user.id if find_user_by_name(params[:username]) && @user.authenticate(params[:password])
  end

  def self.find_user_by_name(name)
    @user = User.find_by(username: name)
  end
end
