class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
    	t.string :name, null: false
    	t.string :email, null: false
    	t.integer :isAdmin
    	t.string :remember_digest
    	t.string :password_digest
       t.timestamps
    end
  end
end
