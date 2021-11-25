class Role < ApplicationRecord
    validates :username, length: { maximum: 20,
        too_long: "%{count} characters is the maximum allowed" }
    has_many :user

    
end
