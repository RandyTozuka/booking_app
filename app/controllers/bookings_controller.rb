class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings.all
  end

  def show
  end

  def new
    @booking = Booking.new
    
  end

  def create
    if current_user.bookings.create(booking_params)
      flash[:success]= "Successfully booked"
      redirect_to '/'
    else
      flash[:danger]= "Your booking failed"
      redirect_to '/'
    end
  end

  def edit
    @booking = current_user.bookings.find(params[:id])
  end

  def update
    if current_user.bookings.update(booking_params)
      flash[:success]= "Successfully changed"
      redirect_to '/'
    else
      flash[:danger]= "Your change failed"
      redirect_to '/'
    end
  end

  def destroy
    @booking = current_user.bookings.find(params[:id])
    if @booking.destroy
      flash[:success]= "Successfully deleted"
    redirect_to root_path
    else
      flash[:danger]= "Delete failed"
      redirect_to root_path
    end
  end

  private
    def booking_params
      params.require(:booking).permit(:date, :slot)
    end

end# of class
