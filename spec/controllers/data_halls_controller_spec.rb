# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe DataHallsController, type: :controller do
  let(:data_hall_report) { create(:data_hall_report) }

  describe 'GET #new' do
    before { get :new, params: { data_hall_report_id: data_hall_report } }

    it 'renders new template' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #show' do
    let(:data_hall) { create(:data_hall) }

    before { get :show, params: { id: data_hall } }

    it 'renders show template' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
    let(:data_hall) { create(:data_hall) }

    before { get :edit, params: { id: data_hall } }

    it 'renders edit template' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates data hall in the database' do
        expect do
          post :create, params: { data_hall: attributes_for(:data_hall), data_hall_report_id: data_hall_report }
        end.to change(DataHall, :count).by(1)
      end

      it 'assigns relation to correct data hall report' do
        post :create, params: { data_hall: attributes_for(:data_hall), data_hall_report_id: data_hall_report }
        expect(assigns(:data_hall).data_hall_report).to eq data_hall_report
      end

      it 'redirects to this data hall' do
        post :create, params: { data_hall: attributes_for(:data_hall), data_hall_report_id: data_hall_report }
        expect(response).to redirect_to assigns(:data_hall)
      end
    end

    context 'with invalid attributes' do
      it 'does not create data hall in the database' do
        expect do
          post :create, params: { data_hall: attributes_for(:data_hall, :invalid), data_hall_report_id: data_hall_report }
        end.to_not change(DataHall, :count)
      end

      it 're-renders new view' do
        post :create, params: { data_hall: attributes_for(:data_hall, :invalid), data_hall_report_id: data_hall_report }
        expect(response).to render_template :new
      end
    end
  end

  describe 'POST #update' do
    let(:data_hall) { create(:data_hall) }

    context 'with valid attributes' do
      before { patch :update, params: { id: data_hall, data_hall: { title: 'Updated Data Hall' } } }

      it 'updates data hall attributes' do
        data_hall.reload
        expect(data_hall.title).to eq 'Updated Data Hall'
      end

      it 'redirects to this data hall' do
        expect(response).to redirect_to data_hall
      end
    end

    context 'with invalid attributes' do
      it 'does not update data hall attributes' do
        patch :update, params: { id: data_hall, data_hall: { title: nil } }
        data_hall.reload
        expect(data_hall.title).to eq 'Data Hall Title'
      end

      it 're-renders edit view' do
        patch :update, params: { id: data_hall, data_hall: { title: nil } }
        expect(response).to render_template :edit
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
