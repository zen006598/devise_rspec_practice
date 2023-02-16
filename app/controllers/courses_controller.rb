class CoursesController < ApplicationController
  before_action :authenticate_user!, only: %i[edit show update destroy show new]
  before_action :find_course, only: %i[edit show update destroy]

  def index
    @courses = Course.all
  end

  def new
    @course = current_user.courses.new
  end

  def create
    @course = current_user.courses.new(params_course)
    if @course.save
      redirect_to @course, notice: 'successfully created Math'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @course.update(params_course)
      redirect_to @course, notice: 'successfully updated Math'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
  end

  def destroy
    @course.destroy
    redirect_to root_path, status: :see_other, notice: 'Math is successfully remove.'
  end

  private

  def params_course
    params.require(:course).permit(:title, :content)
  end

  def find_course
    @course = current_user.courses.find(params[:id])
  end
end
