class Review < ApplicationRecord
    belongs_to :movie 
    belongs_to :user

    validates :rating, presence: true, numericality: { only_integer: true }, length: { is: 1 }
    validates :content, presence: true, length: {maximum: 1000}
end
