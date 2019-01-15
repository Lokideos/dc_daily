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

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'create data hall in the database' do
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
end
# rubocop:enable Metrics/BlockLength
