class BookingsController < ApplicationController
  before_action :set_booking, only: [:update, :validate]

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.character = Character.find(params[:booking][:character_id])
    @booking.user = current_user
    redirect_to profile_path if @booking.save!
  end

  def update
    @booking.update(booking_params)
    authorize @booking
    redirect_to profile_path
  end

  def validate
    authorize @booking
    @booking.update!(status: params[:value] == 'true')
    redirect_to profile_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :character_id, :status)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
