class Review < ApplicationRecord
  belongs_to :lesson
  belongs_to :user

  validates :comment, presence: true
  validates :rating, inclusion: [0, 1, 2, 3, 4, 5]
end
