class CharactersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @characters = policy_scope(Character).order(created_at: :desc)
  end

  def show
    @character = Character.find(params[:id])
    authorize @character
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    authorize @character
    @character.user = current_user
    if @character.save
      redirect_to root_path
    else
      render :profile
    end
  end

  private

  def character_params
    params.require(:character).permit(:name, :description, :image_url, :price_per_day)
  end

end
