class CreateUserAndClassRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :user_and_class_rooms do |t|
            t.belongs_to :user, index: true
            t.belongs_to :class_room, index: true
            t.timestamps null: false
    end
  end
end
