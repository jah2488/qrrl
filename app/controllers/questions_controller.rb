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
    Question.sanitize_params(params[:question])
    @question = current_user.questions.create(params[:question])
    if @question.save
      redirect_to @question, notice: "Question has been asked!"
    else
      params[:question][:tags] = params[:question][:tags].to_s.gsub(/[^\w\.,@-]/,"")
      binding.pry
      render action: "new"
    end
  end

end
