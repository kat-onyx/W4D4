class User < ApplicationRecord
  validates :email, :password_digest, presence: true, uniqueness: true
  validates :session_token, uniqueness: true
  validates :password, length: {minimum: 6, allow_nil: true}

  before_validation :ensure_session_token

  attr_reader :password

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    #something else goes here...??
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    @password = password
  end

  #check...
  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)

    if user && BCrypt::Password.new(user.password_digest).is_password?(password)
      return user
    else
      return nil
    end
  end

end
