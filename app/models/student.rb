class Student < User

  validates :name, presence: { message: "用户名不能为空" }
  validates :name, uniqueness: { message: "用户名已存在" }

end
