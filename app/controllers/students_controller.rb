class StudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student

    if params[:lastname].present?
      @student = Student.find(params[:lastname])
      redirect_to @student
#    else
#      @students = Student.all.order('students.lastname ASC')
    end

    if params[:company].present?
      @students = @students.by_company(params[:company]).order('students.currentlevel DESC').select{|student| student.leftthecompany == false}
      @company = params[:company]
    end
  end

  def show
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to @student
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @student.update(student_params)
      redirect_to @student
    else
      render :edit
    end
  end

  def destroy
    @student.destroy
    redirect_to students_path
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:firstname, :lastname, :company, :division, :originallevel, :currentlevel, :testscoredate, :listeningtestscore, :grammartestscore, :vocabtestscore, :readingtestscore, :leftthecompany)
  end
end
