# frozen_string_literal: true

class ReportsController < ApplicationController
  def new
    @report = Report.new
  end

  def show
    @report = Report.find(params[:id])
  end

  def create
    @report = Report.new(report_params)

    if @report.save
      redirect_to @report, notice: 'Report has been successfully created.'
    else
      flash[:notice] = 'There were some errors in your input.'
      render :new
    end
  end

  private

  def report_params
    params.require(:report).permit(:title, :description)
  end
end
