class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @lesson = Lesson.find(params[:lesson_id])
    @review.lesson = @lesson
    if @review.save
      redirect_to lesson_path(@lesson)
    else
      redirect_to lesson_path(@lesson)
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment, :lesson_id)
  end
end
