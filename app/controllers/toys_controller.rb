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

    respond_to do |format|
      if @toy.save
        
        expire_action action: :show
        @room = Room.find(params[:room_id])
        @room.toys << @toy

        format.html { redirect_to room_path(@room), notice: 'Toy was successfully created.' }
        format.json { render :show, status: :created, location: @toy }
      else
        format.html { render :new }
        format.json { render json: @toy.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @room = Room.find(params[:room_id])
  end

  def update
    respond_to do |format|
      if @toy.update(toy_params)
        expire_action action: :show

        format.html { redirect_to rooms_path, notice: 'Toy was successfully updated.' }
        format.json { render :show, status: :ok, location: @toy }
      else
        format.html { render :edit }
        format.json { render json: @toy.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @toy.destroy
    respond_to do |format|
      format.html { redirect_to toys_url, notice: 'Toy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_toy
      @toy = Toy.find(params[:id])
    end

    def toy_params
      params.require(:toy).permit(:name, :color, :available_num, :price, :room_id, :toy_image)
    end
end
