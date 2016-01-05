class ExamsController < ApplicationController
  load_and_authorize_resource

  def index
    @category = Category.all
    @exam = Exam.new
    @exams = current_user.exams.page params[:page]
  end

  def create
    @exam.user_id = current_user.id
    if @exam.save
      flash[:success] = t "exam.created"
    else
      flash[:danger] = t "error"
    end
    redirect_to :back
  end

  def show
    @exam.change_status
  end

  def update
    @exam.status = :checking if params[:commit] == "finish"
    @exam.status= :saved if params[:commit] == "save"

    if @exam.update_attributes exam_params
      redirect_to exams_path
    else
      render :edit
    end
  end

  private
  def exam_params
    params.require(:exam).permit :category_id, :user_id, :status,
      results_attributes: [:id, :answer, answer: []]
  end
end
