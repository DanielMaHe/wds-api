# frozen_string_literal: true

# This class controll the Workers
class WorkersController < ApplicationController
  before_action :set_worker, only: %i[show update destroy]

  # GET /workers
  def index
    @workers = Worker.all
    render json: {current_user: current_user.username,
      workers: @workers}
  end

  # GET /workers/1
  def show
    render json: @worker
  end

  # POST /workers
  def create
    return unless authorize @worker

    @worker = Worker.new(worker_params)

    if @worker.save
      render json: @worker, status: :created, location: @worker
    else
      render json: @worker.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /workers/1
  def update
    if @worker.update(worker_params)
      render json: @worker
    else
      render json: @worker.errors, status: :unprocessable_entity
    end
  end

  # DELETE /workers/1
  def destroy
    @worker.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_worker
    @worker = Worker.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def worker_params
    params.require(:worker).permit(:username, :password, :isAdmin)
  end
end
