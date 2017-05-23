class Lesson < ApplicationRecord
  belongs_to :user

  CATEGORIES = ['Music', 'Language', 'Science', 'Culture', 'Entrepreneurship', 'Sport', 'Finance']
  LEVELS = ['Beginner', 'Advanced', 'Pro']
  DURATION = (0..8)

  validates :name, :description, :user, :address, :city, presence: true
  validates :category, inclusion: CATEGORIES
  validates :level, inclusion: LEVELS
  validates :duration, inclusion: DURATION

  def disable_days
    JSON.parse(days).join(",")
  end
end
