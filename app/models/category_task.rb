class CategoryTask < ApplicationRecord
  belongs_to :category
  belongs_to :task

  validates :category_id, :task_id, presence: true
  validates :category_id, uniqueness: { scope: :task_id }
end
