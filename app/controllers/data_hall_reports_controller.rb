# frozen_string_literal: true

class DataHallReportsController < ApplicationController
  def new; end

  def show
    @data_halls = data_hall_report.data_halls
  end

  def edit; end

  def create
    @data_hall_report = general_report.data_hall_reports.new(data_hall_report_params)

    if data_hall_report.save
      redirect_to data_hall_report, notice: t('data_hall_reports.notification.created')
    else
      flash[:notice] = t('common.invalid_attributes_error')
      render :new
    end
  end

  def update
    if data_hall_report.update(data_hall_report_params)
      redirect_to data_hall_report, notice: t('data_hall_reports.notification.updated')
    else
      flash[:notice] = t('common.invalid_attributes_error')
      render :edit
    end
  end

  def destroy
    data_hall_report.destroy

    redirect_to data_hall_report.general_report, notice: t('data_hall_reports.notification.deleted')
  end

  private

  def data_hall_report_params
    params.require(:data_hall_report).permit(:title)
  end

  def general_report
    @general_report ||= params[:general_report_id] ? GeneralReport.find(params[:general_report_id]) : data_hall_report.general_report
  end

  def data_hall_report
    @data_hall_report ||= params[:id] ? DataHallReport.find(params[:id]) : general_report.data_hall_reports.new
  end

  helper_method :general_report, :data_hall_report
end
