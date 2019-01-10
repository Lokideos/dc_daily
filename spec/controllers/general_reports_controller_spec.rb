# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
# rubocop:disable Metrics/LineLength
RSpec.describe GeneralReportsController, type: :controller do
  describe 'GET #index' do
    let(:general_reports) { create_list(:general_report, 3) }

    before { get :index }

    it 'populates an array of General Reports' do
      expect(assigns(:general_reports)).to match_array(general_reports)
    end

    it 'render index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'should render new template' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #show' do
    let(:general_report) { create(:general_report) }

    before { get :show, params: { id: general_report } }

    it 'renders show template' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
    let(:general_report) { create(:general_report) }

    before { get :edit, params: { id: general_report } }

    it 'renders edit template' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the  General Report in the database' do
        expect { post :create, params: { general_report: attributes_for(:general_report) } }.to change(GeneralReport, :count).by(1)
      end

      it 'redirects to newly created General Report' do
        post :create, params: { general_report: attributes_for(:general_report) }

        expect(response).to redirect_to assigns(:general_report)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the General Report in the database' do
        expect { post :create, params: { general_report: attributes_for(:general_report, :invalid) } }.to_not change(GeneralReport, :count)
      end

      it 're-renders new view' do
        post :create, params: { general_report: attributes_for(:general_report, :invalid) }

        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    let(:general_report) { create(:general_report) }

    context 'with valid attributes' do
      it 'assign the correct General Report' do
        patch :update, params: { id: general_report, general_report: attributes_for(:general_report) }

        expect(assigns(:general_report)).to eq assigns(:general_report)
      end

      it 'updates the General Report attributes' do
        patch :update, params: { id: general_report, general_report: { title: 'New Report Title', description: 'New Report Description' } }
        general_report.reload

        expect(assigns(:general_report).title).to eq 'New Report Title'
        expect(assigns(:general_report).description).to eq 'New Report Description'
      end

      it 'redirects to update General Report' do
        patch :update, params: { id: general_report, general_report: { title: 'New Report Title' } }

        expect(response).to redirect_to assigns(:general_report)
      end
    end

    context 'with invalid attributes' do
      before { patch :update, params: { id: general_report, general_report: attributes_for(:general_report, :invalid) } }

      it 'does not update the General Report' do
        general_report.reload

        expect(general_report.title).to eq 'General Report Title'
        expect(general_report.description).to eq 'General Report Description'
      end

      it 're-renders edit view' do
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:general_report) { create(:general_report) }

    it 'deletes the General Report from the database' do
      expect { delete :destroy, params: { id: general_report } }.to change(GeneralReport, :count).by(-1)
    end

    it 'redirects to root path' do
      delete :destroy, params: { id: general_report }

      expect(response).to redirect_to root_path
    end
  end
end
# rubocop:enable Metrics/BlockLength
# rubocop:enable Metrics/LineLength
