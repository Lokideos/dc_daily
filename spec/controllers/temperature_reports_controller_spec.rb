# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/LineLength
RSpec.describe TemperatureReportsController, type: :controller do
  describe 'GET #new' do
    let(:report) { create(:report) }

    before { get :new, params: { report_id: report } }

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    let(:report) { create(:report) }

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

    context 'with invalid attributes'
  end
end
# rubocop:enable Metrics/LineLength
