class User < ActiveRecord::Base
  has_many :lists

  before_create :generate_auth_token

  validates :name, presence: true
  validates :password_digest, presence: true
  validates :email, presence: true

  def generate_auth_token
    loop do
      self.auth_token = SecureRandom.base64(64)
      break unless User.find_by(auth_token: auth_token)
    end
  end
end
