class User < ActiveRecord::Base
  has_many :surveys
  validates :email, :username, {presence: true, uniqueness: true}
  validates :pw_hash, presence: true
end
