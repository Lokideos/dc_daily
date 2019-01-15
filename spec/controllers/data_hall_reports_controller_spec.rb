# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/LineLength
# rubocop:disable Metrics/BlockLength
RSpec.describe DataHallReportsController, type: :controller do
  let(:general_report) { create(:general_report) }
  let(:data_hall_report) { create(:data_hall_report, general_report: general_report) }

  describe 'GET #new' do
    before { get :new, params: { general_report_id: general_report } }

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #show' do
    let(:data_halls) { create_list(:data_hall, 3, data_hall_report: data_hall_report) }

    before { get :show, params: { id: data_hall_report } }

    it 'assigns all existing data halls to data_halls' do
      expect(assigns(:data_halls)).to eq data_halls
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
    before { get :edit, params: { id: data_hall_report } }

    it 'renders edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates new Data Hall Report in the database' do
        expect { post :create, params: { data_hall_report: attributes_for(:data_hall_report), general_report_id: general_report } }.to change(DataHallReport, :count).by(1)
      end

      it 'assigns correct relation to related General Report' do
        post :create, params: { data_hall_report: attributes_for(:data_hall_report), general_report_id: general_report }
        expect(assigns(:data_hall_report).general_report).to eq general_report
      end

      it 'redirects to show view of this Data Hall Report' do
        post :create, params: { data_hall_report: attributes_for(:data_hall_report), general_report_id: general_report }
        expect(response).to redirect_to assigns(:data_hall_report)
      end
    end

    context 'with invalid attributes' do
      it 'does not create new Data Hall Report in the database' do
        expect { post :create, params: { data_hall_report: attributes_for(:data_hall_report, :invalid), general_report_id: general_report } }.to_not change(DataHallReport, :count)
      end

      it 're-renders new view' do
        post :create, params: { data_hall_report: attributes_for(:data_hall_report, :invalid), general_report_id: general_report }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      it 'changes the Data Hall Report attributes' do
        patch :update, params: { id: data_hall_report, data_hall_report: { title: 'Updated Data Hall Report Title' } }
        data_hall_report.reload
        expect(data_hall_report.title).to eq 'Updated Data Hall Report Title'
      end

      it 'redirects to show view of this Data Hall Report' do
        patch :update, params: { id: data_hall_report, data_hall_report: attributes_for(:data_hall_report) }
        expect(response).to redirect_to data_hall_report
      end
    end

    context 'with invalid attributes' do
      before { patch :update, params: { id: data_hall_report, data_hall_report: attributes_for(:data_hall_report, :invalid) } }

      it 'does not change Data Hall Report attributes' do
        data_hall_report.reload
        expect(data_hall_report.title).to eq 'Data Hall Report Title'
      end

      it 're-renders edit view' do
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:data_hall_report) { create(:data_hall_report, general_report: general_report) }

    it 'deletes the Data Hall Report from the database' do
      expect { delete :destroy, params: { id: data_hall_report } }.to change(DataHallReport, :count).by(-1)
    end

    it 'redirects to related General Report' do
      delete :destroy, params: { id: data_hall_report }

      expect(response).to redirect_to general_report
    end
  end
end
# rubocop:enable Metrics/BlockLength
# rubocop:enable Metrics/LineLength
