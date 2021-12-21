class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :comments, dependent: :destroy
  validates :content, length: { maximum: 200,
    too_long: "%{count} Limite de caractere exedido!" }
end
