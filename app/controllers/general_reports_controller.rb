# frozen_string_literal: true

class GeneralReportsController < ApplicationController
  def index
    @general_reports = GeneralReport.all
  end

  def new; end

  def show; end

  def edit; end

  def create
    @general_report = GeneralReport.new(general_report_params)

    if general_report.save
      redirect_to general_report, notice: t('general_reports.notification.created')
    else
      flash[:notice] = t('common.invalid_attributes_error')
      render :new
    end
  end

  def update
    if general_report.update(general_report_params)
      redirect_to general_report, notice: t('general_reports.notification.updated')
    else
      flash[:notice] = t('common.invalid_attributes_error')
      render :edit
    end
  end

  def destroy
    general_report.destroy

    redirect_to root_path, notice: t('general_reports.notification.deleted')
  end

  private

  def general_report
    @general_report ||= params[:id] ? GeneralReport.find(params[:id]) : GeneralReport.new
  end

  helper_method :general_report

  def general_report_params
    params.require(:general_report).permit(:title, :description)
  end
end
