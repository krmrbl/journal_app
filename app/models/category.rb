class Category < ApplicationRecord
  has_many :tasks
  belongs_to :user
  validates :category_name, presence: true, uniqueness: true
end