class UsersController < ApplicationController
  def show
    notif_count
  end

  private

  def notif_count
    @count = 0
    current_user.meetings.each do |meeting|
      @count += 1 if (meeting.validated == false || meeting.refused)
    end
    current_user.lessons.each do |lesson|
      lesson.meetings.each do |meeting|
        @count += 1 if (meeting.validated == false && meeting.refused == false)
      end
    end
    return @count
  end
end
