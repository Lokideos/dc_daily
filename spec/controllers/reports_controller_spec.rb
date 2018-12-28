# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
# # rubocop:disable Metrics/LineLength
RSpec.describe ReportsController, type: :controller do
  describe 'GET #new' do
    before { get :new }

    it 'assigns a new Report to @report' do
      expect(assigns(:report)).to be_a_new(Report)
    end

    it 'should render new template' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #show' do
    let(:report) { create(:report) }

    before { get :show, params: { id: report } }

    it 'assigns correct report to @report' do
      expect(assigns(:report)).to eq report
    end

    it 'renders show template' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
    let(:report) { create(:report) }

    before { get :edit, params: { id: report } }

    it 'assigns correct report to @report' do
      expect(assigns(:report)).to eq report
    end

    it 'renders edit template' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the report in the database' do
        expect { post :create, params: { report: attributes_for(:report) } }.to change(Report, :count).by(1)
      end

      it 'redirects to newly created report' do
        post :create, params: { report: attributes_for(:report) }

        expect(response).to redirect_to assigns(:report)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the report in the database' do
        expect { post :create, params: { report: attributes_for(:report, :invalid) } }.to_not change(Report, :count)
      end

      it 're-renders new view' do
        post :create, params: { report: attributes_for(:report, :invalid) }

        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    let(:report) { create(:report) }

    context 'with valid attributes' do
      it 'assign the correct question' do
        patch :update, params: { id: report, report: attributes_for(:report) }

        expect(assigns(:report)).to eq assigns(:report)
      end

      it 'updates the report attributes' do
        patch :update, params: { id: report, report: { title: 'New Report Title', description: 'New Report Description' } }
        report.reload

        expect(assigns(:report).title).to eq 'New Report Title'
        expect(assigns(:report).description).to eq 'New Report Description'
      end

      it 'redirects to update report' do
        patch :update, params: { id: report, report: { title: 'New Report Title' } }

        expect(response).to redirect_to assigns(:report)
      end
    end

    context 'with invalid attributes' do
      before { patch :update, params: { id: report, report: attributes_for(:report, :invalid) } }

      it 'does not update the report' do
        report.reload

        expect(report.title).to eq 'MyString'
        expect(report.description).to eq 'MyText'
      end

      it 're-renders edit view' do
        expect(response).to render_template :edit
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
# rubocop:enable Metrics/LineLength
