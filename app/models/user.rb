class User < ApplicationRecord
    has_many :reviews
    has_many :movies, through: :reviews
    
    validates :name, presence: true, uniqueness: true
    #validates :password
    validates :age, presence: true, numericality: { only_integer: true }
    validates :birthday, presence: true
    validates :country, presence: true
    validates :bio, presence: true, length: {maximum: 300}
end
