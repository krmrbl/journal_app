class Task < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :task_name, presence: true
  validates :task_body, presence: true
  validates :deadline, presence: true
end
