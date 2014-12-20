class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :questions
  has_many :votes

  validates :title, presence: true

  def points
    self.votes.sum(:value)
  end
end
