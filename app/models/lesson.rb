class Lesson < ApplicationRecord
  belongs_to :user

  CATEGORIES = ["Music", "Language", "Science", "Culture", "Entrepreneurship", "Sport", "Finance"]

  validates :name, :description, presence: true
  validates :category, inclusion: CATEGORIES
end
