class PeriodicPayment < ApplicationRecord
	validates :total, presence: true
	has_rich_text :note

	has_many :payments
end
