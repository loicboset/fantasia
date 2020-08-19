class BookingsController < ApplicationController

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    p params
    @booking.character = Character.find(params[:character_id])
    @booking.user = current_user

    if @booking.start_date <= @booking.end_date && @booking.start_date >= Date.today
      @booking.save!
      redirect_to profile_path
    else
      redirect_to character_path(@booking.character), notice: "Invalid date."
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :character_id)
  end
end
