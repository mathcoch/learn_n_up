class MeetingsController < ApplicationController
  def create
    @meeting = Meeting.new
    @meeting.user = current_user
    @lesson = Lesson.find(params[:lesson_id])
    @meeting.lesson = @lesson
    if @meeting.save
      redirect_to lesson_path(@lesson)
    else
      render 'lessons/show'
    end
  end

  private
  def meeting_params
    params.require(:meeting).permit(:name, :category, :description)
  end

end
