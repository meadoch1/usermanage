class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :name, :username, :password, :password_confirmation

  validates_uniqueness_of :username
end