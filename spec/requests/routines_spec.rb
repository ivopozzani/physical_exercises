# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Routines', type: :request do
  let(:user) { create(:user) }
  let(:headers) { { Authorization: sign_in(user) } }
  let(:routine) { create(:routine) }

  describe 'GET /index' do
    it 'returns http success' do
      get routines_path
      expect(response).to have_http_status(:success)
    end

    it 'assigns @routines' do
      routines = create_list(:routine, 3)
      get routines_path
      expect(assigns(:routines)).to eq(routines)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get routine_path(routine.id), headers: headers
      expect(response).to have_http_status(:success)
    end

    it 'assigns @routine' do
      get routine_path(routine.id), headers: headers
      expect(assigns(:routine)).to eq(routine)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get new_routine_path, headers: headers
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    subject do
      exercise1 = create(:exercise)
      exercise2 = create(:exercise)
      post routines_path, headers:,
                          params: { routine: { name: 'Routine', exercise_ids: [exercise1.id, exercise2.id] } }
    end

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
      expect(response).to have_http_status(:success)
    end
  end

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
end
