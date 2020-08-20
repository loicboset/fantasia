class CharactersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_character, except: [ :index, :create ]

  def index
    if params[:search].present?
      @characters = policy_scope(Character).search_by_name(params[:search][:query])
    else
      @characters = policy_scope(Character).order(created_at: :desc)
    end
  end

  def show
    @character = Character.find(params[:id])
    @booking = Booking.new
    @favorite = Favorite.new
    authorize @favorite
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
      redirect_to profile_path
    end
  end

  def edit
  end

  def update
    @character.update(character_params)
    authorize @character
    redirect_to profile_path
  end

  def favorite
    authorize @character
    if params['type'] == "favorite"
      @favorite = Favorite.new(favorite_params)
      @user = current_user.id
      @character = Character.find(params[:id])
      @favorite.user_id = @user
      @favorite.character_id = @character.id
      if @favorite.save
        redirect_to character_path(@character)
      end
    else
      character = Character.find(params[:id])
      favorite = Favorite.where(character_id: character.id, user_id: current_user.id)
      current_user.favorites.delete(favorite)
      redirect_to character_path(@character)
    end
  end

  private

  def character_params
    params.require(:character).permit(:name, :description, :image_url, :price_per_day, :status)
  end

  def favorite_params
    params.permit(:character_id, :user_id)
  end

  def set_character
    @character = Character.find(params[:id])
  end
end
