class QuestionsController < ApplicationController
  before_action :set_test, only: %w[create new]
  before_action :set_question, only: %w[show destroy edit update]
  # used to test via requests (ex. Postman)
  # skip_before_action :verify_authenticity_token, only: :destroy

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show; end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to test_path(@test)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    if @question.destroy
      render plain: 'Question was deleted'
    else
      render plain 'Something went wrong'
    end
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question(s) was not found'
  end
end
