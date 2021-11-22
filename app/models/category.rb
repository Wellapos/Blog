class Category < ApplicationRecord
    has_many :post_cats
    validates :name, length: { maximum: 20,
        too_long: "%{count} Limite de caractere exedido!" }
    validates :description, length: { maximum: 100,
            too_long: "%{count} Limite de caractere exedido!"}
end
