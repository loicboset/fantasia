class BookingsController < ApplicationController

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.character = Character.find(params[:booking][:character_id])
    @booking.user = current_user
    redirect_to profile_path if @booking.save!
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :character_id)
  end
end
