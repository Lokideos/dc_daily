# frozen_string_literal: true

class DataHallsController < ApplicationController
  def new; end

  def show; end

  def edit; end

  def create
    @data_hall = data_hall_report.data_halls.new(data_hall_params)

    if data_hall.save
      redirect_to data_hall, notice: 'You have successfully created Data Hall.'
    else
      flash[:notice] = 'There were some errors in your input.'
      render :new
    end
  end

  def update
    if data_hall.update(data_hall_params)
      redirect_to data_hall, notice: 'You have successfully updated the Data Hall.'
    else
      flash[:notice] = 'There were some errors in your input.'
      render :edit
    end
  end

  def destroy
    data_hall.destroy
    redirect_to data_hall_report, notice: 'Data Hall has been successfully deleted.'
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
