class Test < ApplicationRecord
  def self.test_titles_by_category(category)
    Test.joins("JOIN categories ON tests.category_id = categories.id WHERE categories.title = '#{category}'")
        .pluck(:title).sort.reverse
  end
end
