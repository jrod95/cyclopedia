class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @bicycle = Bicycle.find(params[:bicycle_id])
    @booking = Booking.new(booking_params)
    @booking.bicycle = @bicycle
    @booking.user = current_user
     @booking.price = (@booking.date_end - @booking.date_start).to_i * @bicycle.price
    #  @booking.price = ??

    if @booking.save
      redirect_to bicycle_booking_path(@bicycle, @booking)
    else
      render "bicycles/show"
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:date_start, :date_end)
  end
end


