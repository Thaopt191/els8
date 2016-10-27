class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :action, null:false
      t.references :user, foreign_key: true
      t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end
