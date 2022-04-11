class RoomsController < ApplicationController
  before_action :ensure_user, only: [:edit, :update, :destroy]

  def index
    @search = Room.ransack(params[:q])
    @rooms = @search.result
    @result = @rooms.count
  end

  def new
    @user = current_user
    @room = Room.new
  end

  def create
    @user = current_user
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = "ルームを新規登録しました"
      redirect_to users_posts_path
    else
      render "new"
    end
  end

  def show
    @user = current_user
    @room = Room.find_by(id: params[:id])
    @reservation = Reservation.new
  end

  def edit
    @room = Room.find_by(id: params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      flash[:notice] = "ルームの情報を更新しました"
      redirect_to users_posts_path
    else
      render "edit"
    end
  end

  def destroy
    @room = Room.find_by(id: params[:id])
    @room.destroy
    flash[:notice] = "ルームを削除しました"
    redirect_to users_posts_path
  end
end

private
def room_params
  params.require(:room).permit(:roomname, :image, :info, :price, :address, :user_id)
end

def ensure_user
  @room = Room.find(params[:id])
  if @room.user != current_user
    redirect_to new_room_path
  end
end
