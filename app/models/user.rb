class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  validates :username, presence: true,
                      uniqueness: { case_sensitive: false },
                      length: { minimum: 4, maximum: 20 }
  validates :email, presence: true,
                    uniqueness:  { case_sensitive: false },
                    length: { maximum: 120 },
                    format: { with: URI::MailTo::EMAIL_REGEXP }

  before_save { self.email = email.downcase }

  has_secure_password
end
