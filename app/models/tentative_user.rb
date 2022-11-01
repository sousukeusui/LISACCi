class TentativeUser < ApplicationRecord
    validates :mail, presence: ture, uniqueness: true
    validates :mail, format: {with: /^[\w\-.]+@[a-z\d\-.]+.[a-z]+(.[a-z]+)?$/}
end
