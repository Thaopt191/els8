class CreateResults < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.boolean :isRight, default: false
      t.string :answer, null: false
      t.references :user, index: true, foreign_key: true	
      t.references :word, index: true, foreign_key: true
      t.references :lesson, index: true, foreign_key: true

      t.timestamps
    end
  end
end
