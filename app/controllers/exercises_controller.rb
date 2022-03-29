# frozen_string_literal: true

class ExercisesController < ApplicationController
  before_action :authenticate_user!

  def index
    @exercises = Exercise.all
  end

  def show
    @exercise = Exercise.find(params[:id])
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)

    if @exercise.save
      redirect_to @exercise
    else
      render :new
    end
  end

  def edit
    @exercise = Exercise.find(params[:id])
  end

  def update
    @exercise = Exercise.find(params[:id])

    if @exercise.update(exercise_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    Exercise.destroy(params[:id])
    redirect_to root_path, status: :see_other
  end

  private

  def exercise_params
    params.require(:exercise).permit(:description, :intensity)
  end
end
