class TodoItem < ActiveRecord::Base
	belongs_to :user
	belongs_to :todo_list
	validates :task_name, presence: true
end
