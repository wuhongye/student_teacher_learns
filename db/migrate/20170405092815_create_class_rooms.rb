class CreateClassRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :class_rooms do |t|
      t.string :roomname
      t.timestamps null: false
    end
  end
end
