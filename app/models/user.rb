class User < ApplicationRecord
        # extend Devise::Models
            # Include default devise modules.
            devise :database_authenticatable, :registerable,
                    :recoverable, :rememberable, :trackable, :validatable,
                    :confirmable, :omniauthable
            include DeviseTokenAuth::Concerns::User
  require "securerandom"

  has_secure_password

  validates :email, presence: true
  validates :password, presence: true
  validates :username, presence: true, uniqueness: true
  
end
