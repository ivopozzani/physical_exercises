# frozen_string_literal: true

class CreateExercisesRoutinesJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :exercises, :routines
  end
end
