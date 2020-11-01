class BookingsController < ApplicationController
  def index
    if current_user && Booking.any?
      @bookings = current_user.bookings.all
    end
  end

  def show
  end

  def new
    @booking = Booking.new
    date = "2020-11-01"
    @booking_count1 = Booking.where("date LIKE?", "%#{date}%").where(slot:"11:30~11:45").count
    @booking_count2 = Booking.where("date LIKE?", "%#{date}%").where(slot:"11:45~12:00").count
    @booking_count3 = Booking.where("date LIKE?", "%#{date}%").where(slot:"12:00~12:15").count
    @booking_count4 = Booking.where("date LIKE?", "%#{date}%").where(slot:"12:15~12:30").count
    @booking_count5 = Booking.where("date LIKE?", "%#{date}%").where(slot:"12:30~12:45").count
    @booking_count6 = Booking.where("date LIKE?", "%#{date}%").where(slot:"12:45~13:00").count
    @booking_count7 = Booking.where("date LIKE?", "%#{date}%").where(slot:"13:00~13:15").count
    @booking_count8 = Booking.where("date LIKE?", "%#{date}%").where(slot:"13:15~13:30").count
  end

  def create
    if current_user.bookings.create(booking_params)
      flash[:success]= "Successfully booked"
      redirect_to '/'
    else
      flash[:danger]= "Your booking failed"
      redirect_to '/bookings/new'
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
