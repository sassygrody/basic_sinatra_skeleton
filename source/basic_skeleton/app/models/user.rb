class User < ActiveRecord::Base
  include BCrypt

  # validates :email OR 
  validates :username, :presence => true, :uniqueness => true
  validates :password_hash, :presence => true   #password vs. password_hash

	def password
		@password ||= Password.new(password_hash)
	end

	def password=(pass)
		@password = Password.create(pass)
		self.password_hash = @password
	end

	def self.authenticate(username, password)
		user = User.find_by_username(username)
		return user if user && (user.password == password)
		nil
	end

end