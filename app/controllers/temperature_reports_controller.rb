# frozen_string_literal: true

class TemperatureReportsController < ApplicationController
  def new; end

  def show; end

  def edit; end

  def create
    @temperature_report = report.temperature_reports.new(temperature_report_params)

    if temperature_report.save
      redirect_to temperature_report, notice: 'Temperature report has been successfully created.'
    else
      flash[:notice] = 'There were some errors in your input.'
      render :new
    end
  end

  def update
    if temperature_report.update(temperature_report_params)
      redirect_to temperature_report, notice: 'Temperature Report has been successfully updated.'
    else
      flash[:notice] = 'There were some errors in your input.'
      render :edit
    end
  end

  private

  def temperature_report_params
    params.require(:temperature_report).permit(:title)
  end

  def report
    @report ||= params[:report_id] ? Report.find(params[:report_id]) : temperature_report.report
  end

  def temperature_report
    @temperature_report ||= params[:id] ? TemperatureReport.find(params[:id]) : report.temperature_reports.new
  end

  helper_method :report, :temperature_report
end
