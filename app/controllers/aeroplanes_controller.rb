class AeroplanesController < ApplicationController
  helper :application
  before_action :set_aeroplane, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action do
    redirect_to new_user_session_path unless current_user && current_user.admin?
  end


  def index
    @aeroplanes = Aeroplane.all
  end

  def show
  end

  def new
    @aeroplane = Aeroplane.new
  end

  def create
    @aeroplane = Aeroplane.new(aeroplane_params)
    if @aeroplane.save
      redirect_to aeroplanes_path, notice: 'Aeroplane was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @aeroplane.update(aeroplane_params)
      redirect_to aeroplanes_path, notice: 'Aeroplane was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @aeroplane.destroy
    respond_to do |format|
      format.html { redirect_to aeroplanes_url, notice: 'Aeroplane was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

  def set_aeroplane
    @aeroplane = Aeroplane.find(params[:id])
  end

  def aeroplane_params
    params.require(:aeroplane).permit(:plane, :model, :first_class_columns, :first_class_rows, :business_class_columns, :business_class_rows, :economy_class_columns, :economy_class_rows)
  end
end
