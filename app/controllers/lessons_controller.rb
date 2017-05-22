class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show]

def index
  @lessons = Lesson.all
end

def show
end

def new
  @lesson = Lesson.new
end

def create
  @lesson = Lesson.create(post_params)
  if @lesson.save
    redirect_to lessons_path
  else
    render :new
  end
end


private

def set_lesson
  @lesson = Lesson.find(params[:id])
end

def post_params
  params.require(:lesson).permit(:name, :category, :description)
end

end
