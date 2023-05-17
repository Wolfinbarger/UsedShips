class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @spaceship = Spaceship.find(params[:spaceship_id])
    @user = current_user
  end

  def create
    @user = current_user
    @spaceship = Spaceship.find(params[:spaceship_id])
    @booking = Booking.new(booking_params)
    @booking.spaceship = @spaceship
    @booking.user = @user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to spaceship_path(@booking.spaceship), status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:total_price, :start_date, :end_date)
  end

end
