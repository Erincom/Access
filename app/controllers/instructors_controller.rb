class InstructorsController < ApplicationController
  before_action :authenticate_user!

  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.new(instructor_params)
    if @instructor.save
      redirect_to new_metaclass_path
    else
      render :new
    end
  end

  private

  def instructor_params
    params.require(:instructor).permit(:instructor)
  end
end
