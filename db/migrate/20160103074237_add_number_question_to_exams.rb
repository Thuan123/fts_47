class AddNumberQuestionToExams < ActiveRecord::Migration
  def change
    add_column :exams, :number_question, :integer, default: Settings.exam.question_number
  end
end
