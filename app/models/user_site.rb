class UserSite < ApplicationRecord
  belongs_to :user
  #belongs_to :google_user
  belongs_to :site

  #validates :user_id, presence: true
  #validates :site_id, presence: true
end
