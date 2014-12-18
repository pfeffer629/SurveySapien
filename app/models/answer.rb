class Answer < ActiveRecord::Base
  belongs_to :question

  validates :response, presence: true
end
