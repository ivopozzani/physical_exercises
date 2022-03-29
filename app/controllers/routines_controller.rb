class RoutinesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @routines = Routine.all
  end
  
  def show
    @routine = Routine.find(params[:id])
  end
  
  def new
    @routine = Routine.new
  end
  
  def create
    @routine = Routine.new(routine_params)

    if @routine.save
      redirect_to @routine
    else
      render :new
    end
  end

  def edit
    @routine = Routine.find(params[:id])
  end

  def update
    @routine = Routine.find(params[:id])

    if @routine.update(routine_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    Routine.destroy(params[:id])
    redirect_to root_path, status: :see_other
  end

  private

  def routine_params
    params.require(:routine).permit(:name)
  end
end
