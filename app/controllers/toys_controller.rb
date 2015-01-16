class ToysController < ApplicationController
  before_action :set_toy, only: [:show, :edit, :update, :destroy]

  caches_action :show, expires_in: 1.hour

  def index
    @toys = Toy.all
  end

  def show
  end

  def new
    @toy = Toy.new
    @room = Room.find(params[:room_id])
  end

  def create
    @toy = Toy.new(toy_params)
    if @toy.save       
      expire_action action: :show
      @room = Room.find(params[:room_id])
      @room.toys << @toy
      redirect_to room_path(@room), notice: 'Toy was successfully created.' 
    else
      render :new 
    end
  end

  def edit
    @room = set_toy.room
  end

  def update
    @room = set_toy.room
    if set_toy.update(toy_params)
      expire_action action: :show
      @room = Room.find(params[:room_id])
      redirect_to room_toy_path(@room, @toy), notice: 'Toy was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @toy.destroy
    redirect_to room_path(@toy.room), notice: 'Toy was successfully destroyed.' 
  end

  private
    def set_toy
      @toy = Toy.find(params[:id])
    end

    def toy_params
      params.require(:toy).permit(:name, :color, :available_num, :price, :room_id, :toy_image)
    end
end
