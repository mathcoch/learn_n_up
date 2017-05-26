class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show]
  skip_before_action :authenticate_user!, only: :index

  def index
    @lessons = Lesson.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@lessons) do |lesson, marker|
      marker.lat lesson.latitude
      marker.lng lesson.longitude
    end
  end

  def show
    @meeting = Meeting.new
    @review = Review.new
    @lessons_category = Lesson.where(category: @lesson.category)[0..3]
    @reviews = @lesson.reviews
    @average_rating = -1
    @average_rating = @reviews.reduce(0) { |s,r| s += r.rating }/@reviews.size unless @reviews.empty?

    @reviews

    @hash = Gmaps4rails.build_markers([@lesson]) do |lesson, marker|
      marker.lat lesson.latitude
      marker.lng lesson.longitude
    end
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(meeting_params)
    @lesson.user = current_user
    @lesson.img_url = "#{@lesson.category}.jpg"
    if @lesson.save
      @lesson.description_crop = @lesson.description[0..120] + ' ...'
      @lesson.category_number = @lesson.category_number_method
      @lesson.save
      redirect_to lesson_path(@lesson)
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
