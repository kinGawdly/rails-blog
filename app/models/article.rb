class Article < ApplicationRecord
    validates :name, presence: true, length: { maximum: 100 }
    validates :description, presence: true
    has_one_attached :avatar 
    has_rich_text :body
    has_and_belongs_to_many :categories
    has_many :comments , dependent: :destroy
    # Ensure that both name and description are present
    belongs_to :user

end

