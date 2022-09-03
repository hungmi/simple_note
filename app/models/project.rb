class Project < ApplicationRecord
	has_rich_text :note

	has_many :payments
end
