class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_one :ability
  belongs_to :role
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy
  

  def admin?
    role.id == 1
  end
  
  def comment?  
    role.id == 2
  end

end
