class ToysController < ApplicationController

  def create
    @toy = Toy.new(toy_params)
    @room = Room.find(params[:room_id])
    @toy.room = @room

    if @toy.save
      redirect_to room_path(@room), notice: 'Toy was successfully created.'
    else
      render 'rooms/show'
    end
  end

  private
    def toy_params
      params.require(:toy).permit(:name, :color, :price, :available_num)
    end

end
