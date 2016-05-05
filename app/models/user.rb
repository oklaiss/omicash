class User < ActiveRecord::Base
	# attr_accessor :name, :email, :password, :password_confirmation
	has_secure_password
	# validates :name, :email
	has_many :notifications
end
