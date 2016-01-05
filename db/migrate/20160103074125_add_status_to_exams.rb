class AddStatusToExams < ActiveRecord::Migration
  def change
    add_column :exams, :status, :integer, default: Exam.statuses[:opened]
  end
end
