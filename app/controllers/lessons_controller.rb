class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lesson, only: [:show, :edit, :update, :destroy, :new_student, :save_student, :remove_student]

  def show
    @metaclass = Metaclass.find(params[:metaclass_id])
  end

  def new
    @lesson = Lesson.new
    @metaclass = Metaclass.find(params[:metaclass_id])
    @lesson.classtime = @metaclass.metaclassdaytime
    @lesson.location = @metaclass.metaclasslocation
    @lesson.instructor = @metaclass.instructor
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @metaclass = Metaclass.find(params[:metaclass_id])
    @lesson.metaclass = @metaclass
    @lesson.instructor = @metaclass.instructor
    # @metaclass.students.each do |student|
      # @lesson.students << student
    # end
    if @lesson.save
      redirect_to @metaclass
    else
     render :new
   end
 end

 def new_student
  @metaclass = Metaclass.find(params[:metaclass_id])
 end

 def save_student
  @student = Student.find(params[:lesson][:student_ids][1].to_i)
  @metaclass = @lesson.metaclass
  @lesson.students << @student
  if @lesson.save
    redirect_to metaclass_lesson_path(@metaclass, @lesson)
  else
    render :new_student
  end
end

def remove_student
  @student = Student.find(params[:format])
  @metaclass = Metaclass.find(params[:metaclass_id])
  @lesson.students.delete(@student)
  redirect_to metaclass_lesson_path(@metaclass, @lesson)
end

def edit
  @metaclass = Metaclass.find(params[:metaclass_id])
end

def update
  @metaclass = Metaclass.find(params[:metaclass_id])
  if @lesson.update(lesson_params)
    redirect_to @lesson
  else
    render :edit
  end
end

def destroy
  @metaclass = Metaclass.find(params[:metaclass_id])
  @lesson.destroy
  redirect_to @metaclass
end

private

def set_lesson
  @lesson = Lesson.find(params[:id])
end

def lesson_params
  params.require(:lesson).permit(:classname, :classdate, :classtime, :location)
end
end
