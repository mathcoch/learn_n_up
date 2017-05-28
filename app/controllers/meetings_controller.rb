class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:update, :destroy]

  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.user = current_user
    @lesson = Lesson.find(params[:lesson_id])
    @meeting.lesson = @lesson
    @meeting.status = 'pending'
    if @meeting.save
      # Reject dates taken in meeting from lesson
      @lesson.dates = (@lesson.dates.split(',') - @meeting.dates.split(',')).join(',')
      @lesson.save
      redirect_to user_path
    else
      redirect_to lesson_path(@lesson)
    end
  end

  def update
    @meeting.status = params[:status]
    if @meeting.save
      redirect_to user_path
    else
      render 'users/show'
    end
  end

  def destroy
    @lesson = @meeting.lesson
    # Inject dates from meeting to lesson
    @lesson.dates = (@lesson.dates.split(',') +  @meeting.dates.split(',')).join(',')
    @lesson.save
    @meeting.destroy
    redirect_to user_path
  end

  private

  def set_meeting
    @meeting = Meeting.find(params[:id])
  end

  def meeting_params
    params.require(:meeting).permit(:dates)
  end

end
