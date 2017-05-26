class MeetingsController < ApplicationController
  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.user = current_user
    @lesson = Lesson.find(params[:lesson_id])
    @meeting.lesson = @lesson
    @meeting.status = 'pending'
    if @meeting.save
      @lesson.dates = (@lesson.dates.split(',') - @meeting.dates.split(',')).join(',')
      @lesson.save
      redirect_to user_path(current_user)
    else
      redirect_to lesson_path(@lesson)
    end
  end

  def update
    @meeting = Meeting.find(params[:id])
    @meeting.status = params[:status]

    if @meeting.save
      redirect_to user_path(current_user)
    else
      render 'users/show'
    end
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
