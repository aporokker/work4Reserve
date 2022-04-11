class ApplicationController < ActionController::Base
  # Headerに部屋検索欄を追加
  before_action :header

  protected
  def header
    @search = Room.ransack(params[:q])
    @rooms = @search.result
    if user_signed_in?
      @user = current_user
    end
  end
end
