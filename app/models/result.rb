class Result < ActiveRecord::Base
  belongs_to :question
  has_many :answers
  belongs_to :exam
end
