# frozen_string_literal: true

class DataHallsController < ApplicationController
  def new; end

  def show; end

  def edit; end

  def create
    @data_hall = data_hall_report.data_halls.new(data_hall_params)

    if data_hall.save
      redirect_to data_hall, notice: t('.notification.created')
    else
      flash[:notice] = t('common.invalid_attributes_error')
      render :new
    end
  end

  def update
    if data_hall.update(data_hall_params)
      redirect_to data_hall, notice: t('.notification.updated')
    else
      flash[:notice] = t('common.invalid_attributes_error')
      render :edit
    end
  end

  def destroy
    data_hall.destroy
    redirect_to data_hall_report, notice: t('.notification.deleted')
  end

  private

  def data_hall_params
    params.require(:data_hall).permit(:title, :description)
  end

  def data_hall
    @data_hall ||= params[:id] ? DataHall.find(params[:id]) : data_hall_report.data_halls.new
  end

  def data_hall_report
    @data_hall_report ||= params[:data_hall_report_id] ? DataHallReport.find(params[:data_hall_report_id]) : data_hall.data_hall_report
  end

  helper_method :data_hall, :data_hall_report
end
