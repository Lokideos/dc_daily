# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/LineLength
RSpec.describe TemperatureReportsController, type: :controller do
  let(:report) { create(:report) }

  describe 'GET #new' do
    before { get :new, params: { report_id: report } }

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #show' do
    let(:temperature_report) { create(:temperature_report, report: report) }

    before { get :show, params: { id: temperature_report } }

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'create new temperature report in the database' do
        expect { post :create, params: { temperature_report: attributes_for(:temperature_report), report_id: report } }.to change(TemperatureReport, :count).by(1)
      end

      it 'assigns correct relation to related report' do
        post :create, params: { temperature_report: attributes_for(:temperature_report), report_id: report }
        expect(assigns(:temperature_report).report).to eq report
      end

      it 'redirects to show view of this temperature report' do
        post :create, params: { temperature_report: attributes_for(:temperature_report), report_id: report }
        expect(response).to redirect_to assigns(:temperature_report)
      end
    end

    context 'with invalid attributes' do
      it 'does not create new temperature report in the database' do
        expect { post :create, params: { temperature_report: attributes_for(:temperature_report, :invalid), report_id: report } }.to_not change(TemperatureReport, :count)
      end

      it 're-renders new view' do
        post :create, params: { temperature_report: attributes_for(:temperature_report, :invalid), report_id: report }
        expect(response).to render_template :new
      end
    end
  end
end
# rubocop:enable Metrics/LineLength
