class MovieReview < ApplicationRecord
    belongs_to :movie 
    belongs_to :user

    validates :rating, presence: true, numericality: {only_integer: true, minimum: 1, maximum: 5}
    validates :content, presence: true, length: {maximum: 1000}
end
