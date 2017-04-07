class CreateRenameUsernameFromUsers < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.rename :username, :name
    end
  end
end
