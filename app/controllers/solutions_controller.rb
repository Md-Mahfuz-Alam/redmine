class SolutionsController < ApplicationController
  def index
    @solutions = Solution.where(fault_id: params[:fault_id])
    render json: @solutions
  end

  def new
    @solution = Solution.new
  end

  def create
    @solution = Solution.new(solution_params)
    if @solution.save
      redirect_to stations_path, notice: 'Solution created successfully.'
    else
      render :new
    end
  end

  private

  def solution_params
    params.require(:solution).permit(:name, :fault_id)
  end
end
