class MichiganscoresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_michiganscores, only: [:show, :edit, :update]

  def show
  end

  def new
    @michiganscore = Michiganscore.new
  end

  def create
    @michiganscore = Michiganscore.new(michiganscore_params)
  end

  def edit
  end

  def update
    if @michiganscore.update(michiganscore_params)
      redirect_to @michiganscore
    else
      render :edit
    end
  end

  private

  def set_michiganscores
    @michiganscore = Michiganscore.find(params[:id])
  end

  def assignment_params
    params.require(:michiganscore).permit(:speakingscore, :listeningscore, :grammarscore, :vocabscore, :readscore)
  end
end
