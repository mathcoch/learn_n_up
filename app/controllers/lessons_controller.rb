class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show]
  skip_before_action :authenticate_user!, only: :index

  def index
    @lessons = Lesson.all
  end

  def show
    @meeting = Meeting.new
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(meeting_params)
    @lesson.user = current_user
    if @lesson.save
      redirect_to lessons_path
    else
      render :new
    end
  end

  def category
    @lessons = Lesson.where(category: params[:category])
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def meeting_params
    params.require(:lesson).permit(:name, :category, :description, :level, :duration, :address, :city, :dates)
  end

end
