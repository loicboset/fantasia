class CharactersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_character, except: [:index]

  def index
    if params[:search].present?
      @query = params[:search][:query]
      @characters = policy_scope(Character).where("name iLike '%#{params[:search][:query]}%'")
    else
      @characters = policy_scope(Character).order(created_at: :desc)
    end
  end

  def show
    @character = Character.find(params[:id])
    @booking = Booking.new
    authorize @character
    authorize @booking
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    authorize @character
    @character.user = current_user
    if @character.save
      redirect_to profile_path
    else
      render :profile
    end
  end

  def edit
  end

  def update
    @character.update(character_params)
    authorize @character
    redirect_to profile_path
  end

  private

  def character_params
    params.require(:character).permit(:name, :description, :image_url, :price_per_day)
  end

  def set_character
    @character = Character.find(params[:id])
  end
end
