class AddLessonFromReview < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :lesson, foreign_key: true
  end
end
