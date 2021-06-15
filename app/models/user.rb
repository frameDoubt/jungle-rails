class User < ActiveRecord::Base
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates_uniqueness_of :email
  has_secure_password

end
