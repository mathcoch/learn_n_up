class MeetingsController < ApplicationController
  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.user = current_user
    @lesson = Lesson.find(params[:lesson_id])
    @meeting.lesson = @lesson

    if @meeting.save
      @lesson.dates = JSON.parse(@lesson.dates) - JSON.parse(@meeting.dates)
      @lesson.save
      binding.pry
      redirect_to lesson_path(@lesson)
    else
      render 'lessons/show'
    end
  end

  private
  def meeting_params
    params.require(:meeting).permit(:dates)
  end

end
