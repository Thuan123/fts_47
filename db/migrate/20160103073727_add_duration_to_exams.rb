class AddDurationToExams < ActiveRecord::Migration
  def change
    add_column :exams, :duration, :integer, default: Settings.exam.duration
  end
end
