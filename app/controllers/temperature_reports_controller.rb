# frozen_string_literal: true

class TemperatureReportsController < ApplicationController
  def new; end

  def show; end

  def edit; end

  def create
    @temperature_report = general_report.temperature_reports.new(temperature_report_params)

    if temperature_report.save
      redirect_to temperature_report, notice: t('temperature_reports.notification.created')
    else
      flash[:notice] = t('common.invalid_attributes_error')
      render :new
    end
  end

  def update
    if temperature_report.update(temperature_report_params)
      redirect_to temperature_report, notice: t('temperature_reports.notification.updated')
    else
      flash[:notice] = t('common.invalid_attributes_error')
      render :edit
    end
  end

  def destroy
    temperature_report.destroy

    redirect_to temperature_report.general_report, notice: t('temperature_reports.notification.deleted')
  end

  private

  def temperature_report_params
    params.require(:temperature_report).permit(:title)
  end

  # rubocop:disable Metrics/LineLength
  def general_report
    @general_report ||= params[:general_report_id] ? GeneralReport.find(params[:general_report_id]) : temperature_report.general_report
  end
  # rubocop:enable Metrics/LineLength

  def temperature_report
    @temperature_report ||= params[:id] ? TemperatureReport.find(params[:id]) : general_report.temperature_reports.new
  end

  helper_method :general_report, :temperature_report
end
