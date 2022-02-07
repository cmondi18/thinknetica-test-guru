class QuestionsController < ApplicationController
  before_action :set_test, only: %w[index create]
  before_action :set_question, only: %w[show destroy]
  # used to test via requests (ex. Postman)
  skip_before_action :verify_authenticity_token, only: :destroy

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show; end

  def index; end

  def new; end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to test_questions_path
    else
      render plain 'Something went wrong'
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
