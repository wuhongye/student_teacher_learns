class ClassRoom < ActiveRecord::Base

  has_many :user_and_class_rooms, class_name: "UserAndClassRoom"
  has_many :users, through: :user_and_class_rooms

  validates :roomname, presence: { message: "班级不能为空" }

end
