class User < ApplicationRecord
	enum role: { admin: 0 }
	validates :name, presence: true, uniqueness: true
	has_secure_password
	has_many :payments
end