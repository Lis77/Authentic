class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, default: ''
      t.string :email, null: false
      t.string :password_digest, null: false
      t.integer :last_signed_in_at
      t.boolean :admin, default: false	

      t.timestamps null: false
    end
  end
end
