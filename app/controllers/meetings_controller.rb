class MeetingsController < ApplicationController
  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.user = current_user
    @lesson = Lesson.find(params[:lesson_id])
    @meeting.lesson = @lesson

    if @meeting.save
      @lesson.dates = (@lesson.dates.split(',') - @meeting.dates.split(',')).join(',')
      @lesson.save
      redirect_to lesson_path(@lesson)
    else
      render 'lessons/show'
    end
  end

  def destroy
    @meeting = Meeting.find(params["id"])
    @lesson = @meeting.lesson
    @lesson.dates = @lesson.dates.split(',') +  @meeting.dates_array
    @lesson.save
    @meeting.destroy
    redirect_to user_path
  end

  private
  def meeting_params
    params.require(:meeting).permit(:dates)
  end

end
