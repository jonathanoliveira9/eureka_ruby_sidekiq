class User < ApplicationRecord
  validates :first_name, :last_name, :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP },
                    length: { minimum: 4, maximum: 254 },
                    uniqueness: { case_sensitive: false }
end
