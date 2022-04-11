class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:account, :edit]

  def index
    @search = Room.ransack(params[:q])
    @rooms = @search.result
  end

  def account
    @user = current_user
  end

  def posts
    @rooms = Room.where(user_id: current_user.id)
  end
  
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "プロフィールを更新しました"
      redirect_to edit_user_path
    else
      render "edit"
    end
  end
end

private
def user_params
  params.require(:user).permit(:username, :selfintro, :avatar)
end
