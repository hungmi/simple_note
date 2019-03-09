class Payment < ApplicationRecord
	validates :total, presence: true
	has_rich_text :note

	belongs_to :project, optional: true
	belongs_to :notebook
	belongs_to :periodic_payment, optional: true
	belongs_to :recorder, class_name: "User", foreign_key: :user_id
end
