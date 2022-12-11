class User < ApplicationRecord
	has_secure_password

  has_many :user_sites
  has_many :sites, through: :user_sites

	validates :name, presence: true, length: {maximum: 16}
	validates :mail, presence: true, uniqueness: true
	validates :password_digest, presence: true, uniqueness: true
	validates :account_id, presence: true, length: {maximum: 16}
	#validates :image, presence: ture
	validates :self_introduction, length: {maximum: 100}
	validates :position, length: {maximum: 10}
	validates :mail, format: {with: /\A[\w\-.]+@[a-z\d\-.]+.[a-z]+(.[a-z]+)?\z/}
end
