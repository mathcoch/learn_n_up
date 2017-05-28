class Review < ApplicationRecord
  belongs_to :lesson
  belongs_to :user

  RATINGS = [0, 1, 2, 3, 4, 5]
  validates :comment, presence: true
  validates :rating, inclusion: RATINGS
end
