class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @lesson = Lesson.new
    raise
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @metaclass = params[:metaclassid]
    if @lesson.save
      redirect_to @metaclass
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:classname, :classdate, :classtime, :location)
  end
end
