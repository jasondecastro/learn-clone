class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find(params[:id])
    if current_user.admin
      render 'admin_show'
    else
      render 'show'
    end
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      redirect_to lesson_path(@lesson)
    else
      render 'new'
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update(attraction_params)
      redirect_to lesson_path(@lesson)
    else
      render 'edit'
    end
  end

  def lesson_params
    params.require(:lesson).permit(:name)
  end
end
