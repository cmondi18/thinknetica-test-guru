class QuestionsController < ApplicationController
  before_action :test, only: %w[index create]
  before_action :question, only: %w[show destroy]
  # used to test via requests (ex. Postman)
  # skip_before_action :verify_authenticity_token, only: :destroy

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show; end

  def index; end

  def new; end

  def create
    @question = @test.questions.new(question_params)

    redirect_to test_questions_path if @question.save
  end

  def destroy
    render plain: 'Question was deleted' if @question.destroy
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def test
    @test = Test.find(params[:test_id])
  end

  def question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question(s) was not found'
  end
end
