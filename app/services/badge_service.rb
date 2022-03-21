class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @test = @test_passage.test
  end

  def call
    @badges = []
    Badge.all.select do |badge|
      @badges << badge if send(badge.badge_type, badge.achievement_condition)
    end
  end

  private

  def all_categories(category)
    all_tests_on_category = Test.where(category: category).pluck(:id)
    all_passages_on_category = @user.test_passages.where(current_question_id: nil, test: all_tests_on_category).pluck(:id).uniq
    all_tests_on_category.sort == all_passages_on_category.sort
  end

  def all_levels(level)

  end

  def first_try(_option)
    TestPassage.where(user: @test_passage.user, test: @test_passage.test).count == 1
  end
end