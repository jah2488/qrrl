class QuestionsController < ApplicationController

  def index
    @questions = current_user.questions
  end
  
  def show
    @question = Question.find_by_slug(params[:id])
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find_by_slug(params[:id])
  end
  def create
    sanitize_params(params[:question])
    @question = current_user.questions.create(params[:question])
    if @question.save
      redirect_to @question, notice: "Question has been asked!"
    else
      render action: "new"
    end
  end

  private
  def sanitize_params(question)
    question[:choices] = question[:choices].values
    question[:tags] = question[:tags].split(",")
    if question[:private] == "0"
      question[:private] = false
    else
      question[:private] = true
    end
    return question
  end
end
