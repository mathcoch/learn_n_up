class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @lessons = Lesson.where.not(latitude: nil, longitude: nil)
    @hash = build_map(@lessons)
    @reviews = Review.all.sample(3)
  end

  def show
    @meeting = Meeting.new
    @review = Review.new
     # Select 3 cards for 'you might be interested in'
    @lessons_category = Lesson.where(category: @lesson.category)[0..3]
    @reviews = @lesson.reviews
    @average_rating = @reviews.empty? ? -1 : @reviews.reduce(0) { |s,r| s += r.rating }/@reviews.size
    @hash = build_map([@lesson])
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.user = current_user
    @lesson.img_url = "#{@lesson.category}.jpg" || 'https://lorempixel.com/1600/1000/business/2'

    if @lesson.valid?
      @lesson.description_crop = @lesson.description[0..120] + ' ...'
      @lesson.category_number = @lesson.category_number_method
      @lesson.save
      redirect_to lesson_path(@lesson)
    else
      render :new
    end
  end

  def destroy
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

  def build_map(lessons)
    Gmaps4rails.build_markers(lessons) do |lesson, marker|
      marker.lat lesson.latitude
      marker.lng lesson.longitude
    end
  end

  def lesson_params
    params.require(:lesson).permit(:name, :category, :description, :level, :duration, :address, :city, :dates)
  end
end
