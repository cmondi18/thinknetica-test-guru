class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result gist]
  before_action :set_remaining_time, only: %i[show update]

  def show; end

  def result; end

  def gist
    question = @test_passage.current_question
    service = GistQuestionService.new(question)
    result = service.call

    flash_options = if service.success?
                      html_url = result.html_url
                      current_user.gists.create(question: question, url: html_url)
                      { notice: t('.success', gist_url: html_url) }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @test_passage, flash_options
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      give_badge if @test_passage.success?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def set_remaining_time
    @remaining_time = (@test_passage.created_at + @test_passage.test.duration.minutes - Time.now).round if @test_passage.test.duration
  end

  def give_badge
    badges = BadgeService.new(@test_passage).call
    current_user.badges << badges
    flash[:notice] = 'You have new badges, check it on badge page' if badges
  end
end
