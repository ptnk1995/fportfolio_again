class RoomsController < ApplicationController
  before_action :authenticate_user!
  layout "application_room"
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.build room_params
    if @room.save
      flash[:success] = 'Chat room added !'
      redirect_to rooms_path
    else
      render :new
    end
  end

  def show
    @room = Room.includes(:messages).find_by(id: params[:id])
  end

  private
  def room_params
    params.require(:room).permit(:name)
  end
end
