class FlightsController < ApplicationController
  helper :application
  before_action :authenticate_user! # Require user authentication for all actions
  before_action :authenticate_user!, only: [:index, :edit, :show, :new, :create, :update, :destroy] # Allow only admins to perform CRUD operations

  def index
    @flights = Flight.all
  end

  def show
    @flight = Flight.find(params[:id])
  end

  def new
    @flight = Flight.new
  end

  def create
    @flight = Flight.new(flight_params)
    if @flight.save
      redirect_to @flight, notice: 'Flight was successfully created.'
    else
      render :new
    end
  end

  def edit
    @flight = Flight.find(params[:id])
  end

  def update
    @flight = Flight.find(params[:id])
    if @flight.update(flight_params)
      redirect_to @flight, notice: 'Flight was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @flight = Flight.find(params[:id])
    @flight.destroy
    redirect_to flights_url, notice: 'Flight was successfully destroyed.'
  end

  private

  def flight_params
    params.require(:flight).permit(:origin, :destination, :departure, :arrival, :fcfare, :bcfare, :ecfare, :aeroplane_id)
  end

  def check_admin
    unless current_user && current_user.admin?
      redirect_to flights_path
    end
  end
end
