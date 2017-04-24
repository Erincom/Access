class StudentMetaclassesController < ApplicationController
  def edit
    @student_metaclass = StudentMetaclass.find(params[:id])
  end

  def update
    @student_metaclass = StudentMetaclass.find(params[:id])
    if @student_metaclass.update(student_metaclass_params)
      @metaclass = @student_metaclass.metaclass
      redirect_to @metaclass
    else
      render :edit
    end
  end

  private

  def student_metaclass_params
    params.require(:student_metaclass).permit(:metaclassbeginlevel, :averageattendance)
  end
end
