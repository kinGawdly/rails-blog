class Article < ApplicationRecord
    validates :name, presence: true, length: { maximum: 100 }
    validates :description, presence: true
    has_one_attached :avatar 
    has_rich_text :body
    has_and_belongs_to_many :categories  
    # Ensure that both name and description are present
    belongs_to :user

    def add_categories(ids)
        debugger
        ids.each do |category_id|
            self.categories << Category.find(category_id)
        end
    end
end 