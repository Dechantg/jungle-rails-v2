class User < ActiveRecord::Base

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true
  validate :passwords_match, unless: -> { email.blank? }


  private

  def passwords_match
    errors.add(:password_confirmation, "must match password") unless password == password_confirmation
  end

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    user if user && user.authenticate(password)
  end
  

end