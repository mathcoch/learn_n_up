class MeetingsController < ApplicationController
  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.user = current_user
    @lesson = Lesson.find(params[:lesson_id])
    @meeting.lesson = @lesson
    if @meeting.save
      @lesson.dates = (@lesson.dates.split(',') - @meeting.dates.split(',')).join(',')
      @lesson.save
      redirect_to user_path(current_user)
    else
      redirect_to lesson_path(@lesson)
    end
  end

  def update
    @meeting = Meeting.find(params["id"])
    if params["validate"] == "true"
      @meeting.validated = true
      @meeting.save
    elsif params["decline"] == "true"
      @meeting.refused = true
      @meeting.save
    end
    redirect_to user_path
  end

  def destroy
    @meeting = Meeting.find(params["id"])
    @lesson = @meeting.lesson
    @lesson.dates = (@lesson.dates.split(',') +  @meeting.dates.split(',')).join(',')
    @lesson.save
    @meeting.destroy
    redirect_to user_path
  end

  private
  def meeting_params
    params.require(:meeting).permit(:dates)
  end

end
