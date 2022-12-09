class Site < ApplicationRecord
  has_many :user_sites
  has_many :users, through: :user_sites

  validates :customer, presence: true
  validates :name, presence: true
  validates :address, presence: true
  validates :content, presence: true
  validates :construction_date, presence: true
  validates :progress, presence: true
  validates :check, inclusion: {in: [true,false]}
end
