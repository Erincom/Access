class InstructorsController < ApplicationController
  before_action :authenticate_user!

  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.new
    if @instructor.save
      redirect_to new_metaclass_path
    else
      render :new
    end
  end

  private

  def instructor_params
    params.require(:metaclass).permit(:instructor)
  end
end
