class AddSuccessToTestPassages < ActiveRecord::Migration[6.1]
  def up
    add_column :test_passages, :success, :boolean, default: false
    TestPassage.all.each do |passage|
      passage.update_column(:success, true) if passage.success?
    end
  end

  def down
    remove_column :test_passages, :success
  end
end
