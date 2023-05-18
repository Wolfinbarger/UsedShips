class BookingsController < ApplicationController
  def index
    @spaceships = []
    @bookings = Booking.where(user_id: current_user)
    @bookings.each do |booking|
      @spaceships << Spaceship.where(id: booking.spaceship_id)
    end
    @spaceships.flatten!
  end

  def new
    @booking = Booking.new
    @spaceship = Spaceship.find(params[:spaceship_id])
  end

  def show
    @booking = Booking.find(params[:id])
    @spaceship = Spaceship.find(params[:spaceship_id])
  end

  def create
    @spaceship = Spaceship.find(params[:spaceship_id])
    @booking = Booking.new(booking_params)
    @booking.spaceship = @spaceship
    @booking.user = current_user
    @booking.total_price = ((@booking.end_date - @booking.start_date) * @spaceship.rate).to_i
    if @booking.save
      redirect_to spaceship_booking_path(@spaceship, @booking)
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
    params.require(:booking).permit(:user_id, :spaceship_id, :total_price, :start_date, :end_date)
  end

end
