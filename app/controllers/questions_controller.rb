class QuestionsController < ApplicationController
  
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  
  def index
    @question = Question.all
  end

  def show
    # @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end
  
  def create
    @question = Question.new(questions_params)
    if @question.save
      redirect_to root_path, notice: 'Success!'
    else
      flash[:alert] = 'Save error!'
      render :new
    end
  end

  def edit
    # @question = Question.find(params[:id])
  end
  
  def update
    # @question = Question.find(params[:id])
    if @question.update(questions_params)
      redirect_to root_path, notice: 'Success!'
    else
      flash[:alert] = 'Save error!'
      render :new
    end
  end
  
  def destroy
    # @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path, notice: 'Success!'
  end
  
  private 
    def set_question
      @question = Question.find(params[:id])
    end
  
    def questions_params
      #フォームから送られてきたデータは信用できない。
      params.require(:question).permit(:name, :title, :content)
    end
end
