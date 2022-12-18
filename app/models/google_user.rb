class GoogleUser < ApplicationRecord
  #has_many :user_sites
  #has_many :sites, through: :user_sites

  validates :mail, presence: true, uniqueness: true
end
