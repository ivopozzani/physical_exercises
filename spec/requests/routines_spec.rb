# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Routines', type: :request do
<<<<<<< HEAD
  let(:user) { create(:user) }
  let(:headers) { { Authorization: sign_in(user) } }
  let(:routine) { create(:routine) }

  describe 'GET /index' do
    it 'returns http success' do
      get routines_path
=======
  describe 'GET /index' do
    it 'returns http success' do
      get '/routines/index'
>>>>>>> 5f07509... feat: added Exercises controller and views
      expect(response).to have_http_status(:success)
    end

<<<<<<< HEAD
    it 'assigns @routines' do
      routines = []
      3.times { routines << create(:routine) }

      get routines_path
      expect(assigns(:routines)).to eq(routines)
=======
  describe 'GET /create' do
    it 'returns http success' do
      get '/routines/create'
      expect(response).to have_http_status(:success)
>>>>>>> 5f07509... feat: added Exercises controller and views
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
<<<<<<< HEAD
      get routine_path(routine.id), headers: headers
=======
      get '/routines/show'
>>>>>>> 5f07509... feat: added Exercises controller and views
      expect(response).to have_http_status(:success)
    end

    it 'assigns @routine' do
      get routine_path(routine.id), headers: headers
      expect(assigns(:routine)).to eq(routine)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
<<<<<<< HEAD
      get new_routine_path, headers: headers
=======
      get '/routines/new'
>>>>>>> 5f07509... feat: added Exercises controller and views
      expect(response).to have_http_status(:success)
    end
  end

<<<<<<< HEAD
  describe 'POST /create' do
    subject { post routines_path, headers:, params: { routine: { name: 'Routine' } } }

    it 'returns http found' do
      subject
      expect(response).to have_http_status(:found)
    end

    it 'adds routine to db' do
      expect { subject }.to change(Routine, :count)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get edit_routine_path(routine.id), headers: headers
=======
  describe 'GET /edit' do
    it 'returns http success' do
      get '/routines/edit'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /update' do
    it 'returns http success' do
      get '/routines/update'
>>>>>>> 5f07509... feat: added Exercises controller and views
      expect(response).to have_http_status(:success)
    end
  end

<<<<<<< HEAD
  describe 'PATCH /update' do
    it 'returns http found' do
      patch routine_path(routine.id), headers: headers, params: { routine: { name: 'lorem' } }
      expect(response).to have_http_status(:found)
    end

    it "changes routine's attributes" do
      expect do
        patch routine_path(routine.id), headers: headers, params: { routine: { name: 'lorem' } }
        routine.reload
      end.to change(routine, :name)
    end
  end

  describe 'DELETE /destroy' do
    it 'returns http see_other' do
      delete routine_path(routine.id), headers: headers
      expect(response).to have_http_status(:see_other)
    end

    it 'deletes routine' do
      delete routine_path(routine.id), headers: headers
      expect do
        Routine.find(routine.id)
      end.to raise_error(ActiveRecord::RecordNotFound, "Couldn't find Routine with 'id'=1")
    end
  end
=======
  describe 'GET /destroy' do
    it 'returns http success' do
      get '/routines/destroy'
      expect(response).to have_http_status(:success)
    end
  end
>>>>>>> 5f07509... feat: added Exercises controller and views
end
