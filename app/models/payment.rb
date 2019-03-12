class Payment < ApplicationRecord
	validates :total, presence: true
	has_rich_text :note

	belongs_to :project, optional: true
	belongs_to :notebook
	belongs_to :periodic_payment, optional: true
	belongs_to :recorder, class_name: "User", foreign_key: :user_id

	enum kind: { outcome: 0, income: 1, ignore: 2 }
	scope :today, -> { where("created_at > ?", Time.zone.today) }
	scope :yesterday, -> { where("created_at < ? AND created_at > ?", Time.zone.today, Time.zone.today - 1.day) }
end
