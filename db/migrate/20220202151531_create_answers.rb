class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :body
      t.boolean :correct, default: false
      t.references :question

      t.timestamps
    end
  end
end
