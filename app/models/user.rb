class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_many :posts
  validates :email, length: { maximum: 100,
    too_long: "%{count} characters is the maximum allowed" }
  validates :encrypted_password, length: { minimum: 6, maximum: 50,
      too_long: "%{count} characters is the maximum allowed" }
end
