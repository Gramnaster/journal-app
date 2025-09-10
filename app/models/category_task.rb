class CategoryTask < ApplicationRecord
  belongs_to :category
  belongs_to :task

  validates :category_id, :task_id, presence: true
  validates :category_id, uniqueness: { scope: :task_id }
  validate :same_user_owns_both

  private
  def same_user_owns_both
    return unless category && task
    if category.user != task.user
      errors.add(:base)
    end
  end
end
