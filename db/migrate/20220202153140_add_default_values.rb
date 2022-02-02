class AddDefaultValues < ActiveRecord::Migration[6.1]
  def change
    change_column(:answers, :correct, :boolean, default: false)
    change_column(:tests, :level, :integer, default: 0)
  end
end
