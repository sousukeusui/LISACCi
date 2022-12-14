class TentativeUser < ApplicationRecord
    before_create do
        #新規保存前にトークン生成
        self.token = SecureRandom.urlsafe_base64
    end

    def has_registration_data
        if self.present? && self.expired_at > Time.zone.now
            return true
        else
            return false
        end
    end
    validates :mail, presence: true, uniqueness: true
    validates :mail, format: {with: /\A[\w\-.]+@[a-z\d\-.]+.[a-z]+(.[a-z]+)?\z/}
end
