class User < ActiveRecord::Base
    has_secure_password

    has_many :recipes

	  validates_presence_of :first_name, :last_name, :email, :password_digest
end
