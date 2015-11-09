class User < ActiveRecord::Base
  has_secure_password #just a method

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  #there's not a password in the database, but anytime we first create or change pw, before we save it, we're going to run this validation
  validates :password, length: {
    minimum: 8,
    allow_nil: true # because sometimes there won't be a password, like when we have only a password_digest. it'll be nothing if we only change the email address
  }

  has_many :transgressions, dependent: :destroy
  has_many :confessions, through: :transgressions
end
