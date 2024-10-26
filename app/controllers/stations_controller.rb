class StationsController < ApplicationController
  def new
    @station = Station.new
  end

  def index
    @stations = Station.includes(faults: :solutions)
  end

  def create
    @station = Station.new(station_params)
    if @station.save
      redirect_to stations_path, notice: 'Station added successfully.'
    else
      render :new
    end
  end

  def destroy
    @station = Station.find(params[:id])
    @station.destroy
    respond_to do |format|
      format.html { redirect_to stations_path, notice: 'Station was successfully deleted.' }
      format.js 
    end
  end

  def faults
    station = Station.find(params[:station_id])
    render json: station.faults.select(:id, :name)
  end

  private

  def station_params
    params.require(:station).permit(:name)
  end
end
