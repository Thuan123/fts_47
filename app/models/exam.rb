class Exam < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :results, dependent: :destroy
  has_many :questions, through: :results

  enum status: [:opened, :testing, :saved, :checking, :checked]

  accepts_nested_attributes_for :results, allow_destroy: true

  validates :user_id, presence: true
  validates :category_id, presence: true

  before_create :generate_questions

  def change_status
    if self.opened? ||self.saved?
      self.status = :testing
      self.save
    end
  end

  private
  def generate_questions
    self.questions = self.category.questions.order("RANDOM()").
      limit Settings.exam.question_number
  end
end
