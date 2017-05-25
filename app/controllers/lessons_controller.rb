class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show]
  skip_before_action :authenticate_user!, only: :index

  def index
    @lessons = Lesson.all
    @lessons = Lesson.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@lessons) do |lesson, marker|
      marker.lat lesson.latitude
      marker.lng lesson.longitude
      # marker.infowindow render_to_string(partial: "/lessons/map_box", locals: { lesson: lesson })
    end
  end

  def show
    @meeting = Meeting.new
    @review = Review.new
    @lesson_category = Lesson.where(category: @lesson.category)[0..3]
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(meeting_params)
    @lesson.category_number = @lesson.category_number_method
    @lesson.description_crop = @lesson.description[0..120] + ' ...'
    @lesson.user = current_user
    if @lesson.save
      redirect_to lessons_path
    else
      render :new
    end
  end

  def destroy
    @lesson = Lesson.find(params["id"])
    @lesson.destroy
    redirect_to user_path
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
