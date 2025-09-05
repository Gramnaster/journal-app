class Category < ApplicationRecord
  belongs_to :user

  has_many :category_tasks
  has_many :tasks, through: :category_tasks
end
