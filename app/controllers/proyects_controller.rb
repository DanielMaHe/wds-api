# frozen_string_literal: true

class ProyectsController < ApplicationController
  # before_action :set_proyect, only: %i[show update destroy]

  # GET /proyects
  def index
    @proyects = Proyect.all

    render json: @proyects
  end

  # GET /proyects/1
  def show
    render json: @proyect
  end

  # POST /proyects
  def create
    @proyect = Proyect.new(proyect_params)

    if @proyect.save
      render json: @proyect, status: :created, location: @proyect
    else
      render json: @proyect.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /proyects/1
  def update
    if @proyect.update(proyect_params)
      render json: @proyect
    else
      render json: @proyect.errors, status: :unprocessable_entity
    end
  end

  # DELETE /proyects/1
  def destroy
    @proyect.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_proyect
  #   @proyect = Proyect.find(params[:id])
  # end

  # Only allow a list of trusted parameters through.
  def proyect_params
    params.require(:proyect).permit(:company, :status, :comment, images_attributes: %i[id file])
  end
end
