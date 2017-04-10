class SessionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @session = Session.new
  end

  def create
    @session = Session.new(session_params)
    if @session.save
      redirect_to new_metaclass_path
    else
      render :new
    end
  end

  private

  def session_params
    params.require(:session).permit(:sessionname, :sessionstartdate, :sessionenddate)
  end
end
