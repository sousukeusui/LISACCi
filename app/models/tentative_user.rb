class TentativeUser < ApplicationRecord
    validates :mail, presence: true, uniqueness: true
    validates :mail, format: {with: /\A[\w\-.]+@[a-z\d\-.]+.[a-z]+(.[a-z]+)?\z/}
end
