class Review < ApplicationRecord
    belongs_to :movie 
    belongs_to :user

    has_many :comments

    has_many :likes
    has_many :likes, through: :users

    validates :rating, presence: true, numericality: { only_integer: true }, length: { is: 1 }
    validates :content, presence: true, length: {maximum: 1000}
end
