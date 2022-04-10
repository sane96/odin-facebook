class Post < ApplicationRecord
    belongs_to :user, foreign_key: 'user_id'
    has_many :comments, dependent: :destroy    
    has_many :likes, dependent: :destroy
    
    validates :body, presence: true, length: {minimum: 1}
end
