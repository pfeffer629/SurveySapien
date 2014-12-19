class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :answers

  validates :query, presence: true
end
