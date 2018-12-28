# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :load_report, only: %i[show edit update destroy]

  def index
    @reports = Report.all
  end

  def new
    @report = Report.new
  end

  def show; end

  def edit; end

  def create
    @report = Report.new(report_params)

    if @report.save
      redirect_to @report, notice: 'Report has been successfully created.'
    else
      flash[:notice] = 'There were some errors in your input.'
      render :new
    end
  end

  def update
    if @report.update(report_params)
      redirect_to @report, notice: 'Report has been successfully updated.'
    else
      flash[:notice] = 'There were some errors in your input.'
      render :edit
    end
  end

  def destroy
    @report.destroy

    redirect_to root_path
  end

  private

  def load_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:title, :description)
  end
end
