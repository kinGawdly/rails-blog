class Article < ApplicationRecord
    validates :name, presence: true, length: { maximum: 100 }
    validates :description, presence: true 
    # Ensure that both name and description are present
end
