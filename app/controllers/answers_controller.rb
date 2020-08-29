class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new
    if @answer.update(answer_params)
      redirect_to question_path(@question), notice: 'Success!'
    else
      redirect_to question_path(@question), alert: 'Invalid!'
    end
  end

  def edit
    find
    @answer = @question.answers.find(params[:id])
  end
  
  def destroy
    find
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    redirect_to question_path(@question), notice: 'Delete!'
  end
  
  def update
    find
    @answer = @question.answers.find(params[:id])
    if @answer.update(answer_params)
      redirect_to question_path(@question), notice: 'Success!'
    else
      flash[:alert] = 'Invalid!'
      render :edit
    end
  end
  
  
  private
  def answer_params
    params.require(:answer).permit(:content, :name, :question_id)
  end
  
  def find 
    @question = Question.find(params[:question_id])
  end
end
