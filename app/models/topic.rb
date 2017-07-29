class Topic < ApplicationRecord
    has_many :works, dependent: :destroy
end
