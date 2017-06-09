class StudentLessonsController < ApplicationController
  def edit
    @student_lesson = StudentLesson.find(params[:id])
  end

  def update
    @student_lesson = StudentLesson.find(params[:id])
    if @student_lesson.update(student_lesson_params)
      @lesson = @student_lesson.lesson
      @metaclass = @lesson.metaclass
      redirect_to metaclass_lesson_path(@metaclass, @lesson)
    else
      render :edit
    end
  end

  private

  def student_lesson_params
    params.require(:student_lesson).permit(:attendance)
  end
end
