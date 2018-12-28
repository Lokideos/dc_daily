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
      redirect_to report, notice: 'Report has been successfully created.'
    else
      flash[:notice] = 'There were some errors in your input.'
      render :new
    end
  end

  def update
    if report.update(report_params)
      redirect_to report, notice: 'Report has been successfully updated.'
    else
      flash[:notice] = 'There were some errors in your input.'
      render :edit
    end
  end

  def destroy
    report.destroy

    redirect_to root_path, notice: 'Report has been successfully deleted'
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
