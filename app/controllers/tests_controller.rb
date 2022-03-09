class TestsController < ApplicationController
  before_action :set_test, only: %i[start]
  before_action :set_tests, only: %i[index start]

  def index; end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def set_tests
    @tests = Test.where(public: true)
  end

  def set_test
    @test = Test.find(params[:id])
  end
end
