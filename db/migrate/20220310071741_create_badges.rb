class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string title, null: false
      t.string file_name, null: false
      t.integer type, null: false

      t.timestamps
    end
  end
end
