class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :post_cats, dependent: :destroy
  validates :name, length: { maximum: 50,
    too_long: "%{count} characters is the maximum allowed" }
  validates :summary, length: { maximum: 300,
    too_long: "%{count} characters is the maximum allowed" }
  validates :content, length: { maximum: 1000,
    too_long: "%{count} characters is the maximum allowed" }

end
