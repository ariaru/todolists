class User < ActiveRecord::Base
	has_one :profile, dependent: :destroy
	has_many :todo_lists, dependent: :destroy
	# Assignments specifies to use :source option even though the name of the
	# source association can be automatically inferred from the association name
	has_many :todo_items, through: :todo_lists, source: :todo_items, dependent: :destroy

	validates :username, presence: true
end
