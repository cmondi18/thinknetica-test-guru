class QuestionsController < ApplicationController
  before_action :test, except: :show

  def show
    render json: Question.where(id: params[:id])
  end

  def index
    render json: @questions = @test.questions
  end

  private

  def question_params
    params.require(:post).permit(:body, :test_id)
  end

  def test
    @test = Test.find(params[:test_id])
  end
end
