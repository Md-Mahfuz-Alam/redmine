class FaultsController < ApplicationController
  def index
    @faults = Fault.where(station_id: params[:station_id])
    render json: @faults
  end

  def new
    @fault = Fault.new
  end

  def create
    @fault = Fault.new(fault_params)
    if @fault.save
      redirect_to stations_path, notice: 'Fault created successfully.'
    else
      render :new
    end
  end

  def edit
    @fault = Fault.find(params[:id])
  end

  def update
    @fault = Fault.find(params[:id])
    if @fault.update(fault_params)
      redirect_to stations_path, notice: 'Fault updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @fault = Fault.find(params[:id])
    @fault.destroy
    redirect_to stations_path, notice: 'Fault deleted successfully.'
  end

  def solutions
    fault = Fault.find(params[:fault_id])
    render json: fault.solutions.select(:id, :name)
  end

  private

  def fault_params
    params.require(:fault).permit(:name, :station_id)
  end
end
