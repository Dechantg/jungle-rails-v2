class User < ActiveRecord::Base

  has_secure_password
  
  validates :first_name, presence: { message: "First Name Cannot Be Blank" }
  validates :last_name, presence: { message: "Last Name Cannot Be Blank" }
  validates :email, presence: { message: "Please Enter A Valid Email" }, uniqueness: { case_sensitive: false }
  validates :password, presence: { message: "Please Enter A Valid Password (8 Characters Minimum)" }
  validates :password_confirmation, presence: { message: "Please Confirm Your Password" }
  validates_length_of :password, minimum: 8, message: "Password Must Exceed 8 Characters", allow_nil: true
  validate :passwords_match, unless: -> { email.blank? }

  private

  def passwords_match
    errors.add(:password_confirmation, "Passwords Must Match") unless password == password_confirmation
  end

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    user if user && user.authenticate(password)
  end
  

end