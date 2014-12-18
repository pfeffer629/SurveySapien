class User < ActiveRecord::Base
  has_many :surveys
  validates :email, :username, {presence: true, uniqueness: true}
  validates :pw_hash, presence: true

  before_save :gravatar_src

  def gravatar_src
    email_address = self.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    self.gravatar = "http://www.gravatar.com/avatar/#{hash}"
  end

end
