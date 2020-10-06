class Payment < ApplicationRecord
	validates :total, presence: true
	has_rich_text :note
	has_one :action_text_rich_text, class_name: 'ActionText::RichText', as: :record

	belongs_to :project, optional: true
	belongs_to :notebook
	belongs_to :periodic_payment, optional: true
	belongs_to :recorder, class_name: "User", foreign_key: :user_id

	enum kind: { outcome: 0, income: 1, ignore: 2 }
	scope :today, -> { where("created_at > ?", Time.zone.today) }

	attr_accessor :total_text

	def self.daily_outcome_avg(project_id)
		payments = Payment.where(project_id: project_id, notebook: Notebook.find_by(name: "生活"))
		if payments.outcome.pluck("DATE(created_at)").uniq.size > 0
			(payments.outcome.sum(:total) / payments.outcome.pluck("DATE(created_at)").uniq.size).to_i
		else
			0
		end
	end
end
