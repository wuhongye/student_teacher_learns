class User < ActiveRecord::Base
    
    validates :name, presence: { message: "用户名不能为空" }
    validates :name, uniqueness: { message: "用户名已存在" }

    before_save :update_name

    has_many :user_and_class_rooms, class_name: "UserAndClassRoom"
    has_many :class_rooms, through: :user_and_class_rooms

    attr_accessor :password
    attr_accessor :password_confirmation

    validate :validate_password, on: :create
    before_create :set_password

    def self.authenticate name, password
        user = find_by(name: name)
        if user and user.valid_password?(password)
            user
        else
            nil
        end
    end

    def valid_password? password
        self.crypted_password == Digest::SHA256.hexdigest(password + self.salt)
    end

    private
    def validate_password
        if self.password.blank?
        self.errors.add(:password, "密码不能为空")
        return false
    end

    unless self.password == self.password_confirmation
        self.errors.add(:password_confirmation, "密码不一致")
        return false
    end
        return true
    end

    def set_password
        self.salt = Time.now.to_i
        self.crypted_password = Digest::SHA256.hexdigest(self.password + self.salt)
    end

    def update_name
        self.name = self.name.downcase
    end

end
