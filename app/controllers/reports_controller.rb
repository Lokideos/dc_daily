# frozen_string_literal: true

class ReportsController < ApplicationController
  def index
    @reports = Report.all
  end

  def new; end

  def show; end

  def edit; end

  def create
    @report = Report.new(report_params)

    if report.save
      redirect_to report, notice: t('reports.notification.created')
    else
      flash[:notice] = t('common.invalid_attributes_error')
      render :new
    end
  end

  def update
    if report.update(report_params)
      redirect_to report, notice: t('reports.notification.updated')
    else
      flash[:notice] = t('common.invalid_attributes_error')
      render :edit
    end
  end

  def destroy
    report.destroy

    redirect_to root_path, notice: t('reports.notification.deleted')
  end

  private

  def report
    @report ||= params[:id] ? Report.find(params[:id]) : Report.new
  end

  helper_method :report

  def report_params
    params.require(:report).permit(:title, :description)
  end
end
