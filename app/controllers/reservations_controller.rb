class ReservationsController < ApplicationController
  before_action :ensure_user, only: [:destroy]
  
    def index
      @user = current_user
      @reservations = @user.reservations
    end
    
    def new
    end

    def create
      @reservation = Reservation.new(reservation_params)
      if @reservation.save
        flash[:notice] = "予約が完了しました"
        redirect_to reservations_path
      else
        @user = current_user
        @room = Room.find_by(id: @reservation.room_id)
        render "rooms/show"
      end
    end
  
    def destroy
      @reservation = Reservation.find_by(id: params[:id])
      @reservation.destroy
      flash[:notice] = "予約を削除しました"
      redirect_to reservations_path
    end
end

private
def reservation_params
  params.require(:reservation).permit(:startdate, :enddate, :num_of_people, :user_id, :room_id)
end
  
def ensure_user
  @reservation = Reservation.find(params[:id])
  if @reservation.user != current_user
    redirect_to new_reservation_path
  end
end
