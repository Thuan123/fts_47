class Admin::ExamsController < ApplicationController
  load_and_authorize_resource

  def index
    @exams = @exams.page params[:page]
  end

  def destroy
    @exam.destroy
    flash[:success] = t "exam.admin.delete_exam.success"
    redirect_to admin_exams_path
  end

  def update
    @exam.status = :checked
    if @exam.update_attributes exam_params
      flash[:notice] = t "exam.checked.success"
      redirect_to admin_exams_path
     else
      flash[:alert] = t "exam.checked.fails"
      render :edit
    end
  end

  private
  def exam_params
    params.require(:exam).permit :category_id, :user_id, :status,
      results_attributes: [:id, :correct, answer: []]
  end
end
