class User < ApplicationRecord
    validates :name, presence: true, length: {maximum: 16}
    validates :mail, presence: true, uniqueness: true
    validates :password_digest, presence: true, uniqueness: true
    validates :account_id, presence: true, length: {maximum: 16}
    #validates :image, presence: ture
    validates :self_introduction, length: {maximum: 100}
    validates :position, length: {maximum: 10}
    validates :mail, format: {with: /^[\w\-.]+@[a-z\d\-.]+.[a-z]+(.[a-z]+)?$/}
end
