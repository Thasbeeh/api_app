class Task < ApplicationRecord
	validates :title, presence: true
	validates_date :due_date, presence: true
	enum :status, %w[pending in_progress completed]
end
