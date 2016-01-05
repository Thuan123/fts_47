class AddAnswerToResults < ActiveRecord::Migration
  def change
    add_column :results, :answer, :string, default: ""
  end
end
