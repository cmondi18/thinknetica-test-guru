class User < ApplicationRecord
  def tests_by_level(level)
    Test.joins("JOIN user_tests ON tests.id = user_tests.test_id")
        .where('level = ?', level).where('user_id = ?', id)
  end
end
