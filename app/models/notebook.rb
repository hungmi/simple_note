class Notebook < ApplicationRecord
	has_rich_text :note
	
	has_many :payments
end
