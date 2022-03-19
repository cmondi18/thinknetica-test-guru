class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result gist]

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
      give_badges
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def give_badges
    badges = Badge.all
    badges.each do |badge|
      case Badge.badge_types[badge.badge_type]
      when 0
        category = badge.category_id
        all_tests_on_category = Test.where(category: category).map(&:id)
        # First take all finished TestPassages, then take all test from it, select where test category is equal badge category, then take uniq ids
        all_passages_on_category = TestPassage.where(current_question_id: nil).map(&:test).select{ |test| test.category_id == category }.map(&:id).uniq
        current_user.badges << badge if all_tests_on_category.sort == all_passages_on_category.sort
      when 1
        level = badge.level
        all_tests_on_level = Test.where(level: level).map(&:id)
        # First take all finished TestPassages, then take all test from it, select where test level is equal badge level, then take uniq ids
        all_passages_on_level = TestPassage.where(current_question_id: nil).map(&:test).select{ |test| test.level == level }.map(&:id).uniq
        current_user.badges << badge if all_tests_on_level.sort == all_passages_on_level.sort
      when 2
        if TestPassage.where(user: @test_passage.user, test: @test_passage.test).count == 1 && @test_passage.success?
          current_user.badges << badge
        end
      end
    end
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
