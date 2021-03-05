class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update, :destroy]

  def index
    @houses = House.all
  end

  def show
    @stations = @house.stations
  end

  def new
    @house = House.new
    2.times { @house.stations.build }
  end

  def edit
    @house.stations.build
  end

  def create
    @house = House.new(house_params)
      if @house.save
        redirect_to houses_path: "物件を登録しました"
      else
        2.times { @house.stations.build }
        render :new
      end
  end

  def update
    if @house.update(house_params)
      redirect_to houses_path, notice: "物件を編集しました"
    else
      @house.stations.build
      render :edit
    end
  end

  def destroy
    @house.destroy
    respond_to do |format|
      format.html { redirect_to houses_url, notice: 'House was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_house
      @house = House.find(params[:id])
    end

    def house_params
      params.require(:house).permit(:name, :rent, :adress, :age, :content, stations_attributes: [:route_name, :station_name, :walking_minutes, :id, :_destroy, :house_id])
    end
end
