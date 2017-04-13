class AssignmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]

  def index
    @assignments = Assignment

    if params[:assignmentdescription].present?
      @assignment = Assignment.find(params[:assignmentdescription])
      redirect_to @assignment
    end
  end

  def show
  end

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.new(assignment_params)
    if @assignment.save
      redirect_to @assignment
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @assignment.update(assignment_params)
      redirect_to @assignment
    else
      render :edit
    end
  end

  def destroy
    @assignment.destroy
    redirect_to :root
  end

  private

  def set_assignment
    @assignment = Assignment.find(params[:id])
  end

  def assignment_params
    params.require(:assignment).permit(:assignmentdescription, :assignmentdate)
  end
end
