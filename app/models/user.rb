class User < ActiveRecord::Base
  has_many :exams
  has_many :questions
  has_many :categories, through: :exams
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
end
