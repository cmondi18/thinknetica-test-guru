class User < ApplicationRecord
  def tests_by_level(level)
    Test.joins("JOIN user_tests ON tests.id = user_tests.test_id WHERE level = #{level} AND user_tests.user_id = #{self.id}").first
  end
end
