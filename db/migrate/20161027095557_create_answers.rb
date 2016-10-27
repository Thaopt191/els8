class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :answer, null:false
      t.boolean :isRight, null: false
      t.references :word, foreign_key: true

      t.timestamps
    end
  end
end
