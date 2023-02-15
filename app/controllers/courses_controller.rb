class CoursesController < ApplicationController
  before_action :find_course, only: %i[edit show update destory]

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(params_course)
    if @course.save
      redirect_to @course, notice: 'successfully created Math'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @course.update(params_course)
      redirect_to @course, notice: 'successfully updated Math'
    else
      render :edit
    end
  end

  def show
  end

  def destory
  end

  private

  def params_course
    params.require(:course).permit(:title, :content)
  end

  def find_course
    @course = Course.find(params[:id])
  end
end
