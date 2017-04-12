class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :type
      t.string :crypted_password, null: false
      t.string :salt, null: false
      t.timestamps null: false
    end
  end
end
