class MetaclassesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_metaclass, only: [:new_student, :save_student, :remove_student, :show, :edit, :update, :destroy]

  def index
    @metaclasses = Metaclass

    if params[:metaclassname].present?
      @metaclass = Metaclass.find(params[:metaclassname])
      redirect_to @metaclass
    end
  end

  def show
  end

  def new
    @metaclass = Metaclass.new
  end

  def new_student
  end

  def save_student
    @student = Student.find(params[:metaclass][:student_ids][1].to_i)
    @metaclass.students << @student
    if @metaclass.save
      redirect_to @metaclass
    else
      render :new_student
    end
  end

  def remove_student
    @student = Student.find(params[:format])
    @metaclass.students.delete(@student)
    redirect_to @metaclass
  end

  def create
    @metaclass = Metaclass.new(metaclass_params)
    if @metaclass.save
      redirect_to @metaclass
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @metaclass.update(metaclass_params)
      redirect_to @metaclass
    else
      render :edit
    end
  end

  def destroy
    @metaclass.destroy
    redirect_to metaclasses_path
  end

  private

  def set_metaclass
    @metaclass = Metaclass.find(params[:id])
  end

  def metaclass_params
    params.require(:metaclass).permit(:metaclassname, :metaclassdaytime, :metaclasslocation, :metaclassnote)
  end
end
