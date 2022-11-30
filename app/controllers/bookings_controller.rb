class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @aircraft = Aircraft.find(params[:aircraft_id])
    @booking = Booking.new
  end

  def edit
  end

  def create
    @aircraft = Aircraft.find(params[:aircraft_id])
    @booking = Booking.new(booking_params)
    @booking.aircraft = @aircraft
    #@booking.user = current_user
    @booking.user_id = 1

    if @booking.save
      redirect_to aircraft_bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @booking.update(booking_params)
      redirect_to @booking, notice: "booking was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_url, notice: "booking was successfully destroyed."
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    #params.require(:booking).permit(:name, :seats, :price, :description)
    params.require(:booking).permit(:start_time, :finish_time, :aircraft_id)
  end
end
