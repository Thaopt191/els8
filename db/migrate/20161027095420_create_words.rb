class CreateWords < ActiveRecord::Migration[5.0]
  def change
    create_table :words do |t|
      t.string :word, null:false
      t.references :category, index: true, foreign_key: true
      t.references :lesson, index: true, foreign_key: true

      t.timestamps
    end
  end
end
