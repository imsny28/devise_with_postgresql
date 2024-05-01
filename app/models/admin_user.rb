class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :recoverable, :rememberable, :validatable,
         :two_factor_authenticatable, otp_secret_encryption_key: Devise.secret_key

  
end
