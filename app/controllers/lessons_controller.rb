class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show]

def index
  @lessons = Lesson.all
end

def show
end

private

def set_lesson
  @lesson = Lesson.find(params[:id])
end

def post_params
  params.require(:lesson).permit(:name, :category, :description)
end

end
