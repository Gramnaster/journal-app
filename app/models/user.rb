class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, length: { minimum: 6, maximum: 15 }

  has_many :categories
  has_many :tasks
  has_many :category_tasks, through: :categories
end
