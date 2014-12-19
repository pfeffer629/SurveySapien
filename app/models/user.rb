class User < ActiveRecord::Base
	has_many :surveys
	validates :email, :username, {presence: true, uniqueness: true}
	validates :pw_hash, presence: true
  validates :email, format: {with: /\S+@{1}\S+[.]\D{2,}/, message: 'is not a valid email address'}

	before_save :gravatar_src

	def gravatar_src
	email_address = self.email.downcase
	hash = Digest::MD5.hexdigest(email_address)
	self.gravatar = "http://www.gravatar.com/avatar/#{hash}"
	end

	def password
	  @password ||= BCrypt::Password.new(pw_hash) if pw_hash
	end

	def password=(new_password)
	  @password = BCrypt::Password.create(new_password)
	  self.pw_hash = @password
	end

	def authenticate(password)
	  self.pw_hash == password
	end

end
