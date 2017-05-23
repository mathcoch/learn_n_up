class Lesson < ApplicationRecord
  belongs_to :user

  CATEGORIES = ['Music', 'Language', 'Science', 'Culture', 'Entrepreneurship', 'Sport', 'Finance']
  LEVELS = ['Beginner', 'Advanced', 'Pro']
  DURATION = (0..20)

  validates :name, :description, :user, presence: true
  validates :category, inclusion: CATEGORIES
  validates :level, inclusion: LEVELS
  validates :duration, inclusion: DURATION
end
