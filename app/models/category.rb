class Category < ApplicationRecord
    has_many :works, dependent: :destroy
end
