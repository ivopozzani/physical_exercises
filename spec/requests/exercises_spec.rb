# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Exercises', type: :request do
  let(:user) { create(:user) }
  let(:headers) { { Authorization: sign_in(user) } }
  let(:exercise) { create(:exercise) }

  describe 'GET /index' do
    it 'returns http success' do
      get exercises_path, headers: headers
      expect(response).to have_http_status(:success)
    end

    it 'assigns @exercises' do
      exercises = create_list(:exercise, 2)
      get exercises_path, headers: headers
      expect(assigns(:exercises)).to eq(exercises)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get exercise_path(exercise.id), headers: headers
      expect(response).to have_http_status(:success)
    end

    it 'assigns @exercise' do
      get exercise_path(exercise.id), headers: headers
      expect(assigns(:exercise)).to eq(exercise)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get new_exercise_path, headers: headers
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    subject { post exercises_path, headers:, params: { exercise: { description: 'lorem', intensity: 2 } } }

    it 'returns http found' do
      subject
      expect(response).to have_http_status(:found)
    end

    it 'adds exercise to db' do
      expect { subject }.to change(Exercise, :count)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get edit_exercise_path(exercise.id), headers: headers
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH /update' do
    it 'returns http found' do
      patch exercise_path(exercise.id), headers: headers, params: { exercise: { description: 'lorem' } }
      expect(response).to have_http_status(:found)
    end

    it "changes exercise's attributes" do
      expect do
        patch exercise_path(exercise.id), headers: headers, params: { exercise: { description: 'lorem' } }
        exercise.reload
      end.to change(exercise, :description)
    end
  end

  describe 'DELETE /destroy' do
    it 'returns http see_other' do
      delete exercise_path(exercise.id), headers: headers
      expect(response).to have_http_status(:see_other)
    end

    it 'deletes exercise' do
      delete exercise_path(exercise.id), headers: headers
      expect do
        Exercise.find(exercise.id)
      end.to raise_error(ActiveRecord::RecordNotFound, "Couldn't find Exercise with 'id'=1")
    end
  end
end
