class LessonsController < ApplicationController
  before_action :authorize

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
    if current_user.admin
      render 'show'
    else
      render 'edit'
    end
  end

  def create
    current_track = Track.all.first
    @lesson = Lesson.new(lesson_params)
    @lesson.track = current_track
    binding.pry
    if @lesson.save
      redirect_to lesson_path(@lesson)
    else
      render 'new'
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
    if current_user.admin
      render :edit
    else
      render :show
    end
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      redirect_to lesson_path(@lesson)
    else
      render 'edit'
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
  end


private

  def lesson_params
    params.require(:lesson).permit(:name, :content)
  end
end
