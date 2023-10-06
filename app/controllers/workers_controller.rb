# frozen_string_literal: true

# This class controll the Workers
class WorkersController < ApplicationController
  before_action :set_worker, only: %i[show update destroy]

  # GET /workers
  def index
    authorized?
    @workers = Worker.all
    render json: { username: current_user.username,
                   workers: @workers }
  end

  # GET /workers/1
  def show
    @worker.id == current_user.id || authorized?
    render json: @worker
  end

  # POST /workers
  def create
    authorized?

    @worker = Worker.new(worker_params)

    if @worker.save
      render json: @worker, status: :created, location: @worker
    else
      render json: @worker.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /workers/1
  def update
    authorized?
    if @worker.update(worker_params)
      render json: @worker
    else
      render json: @worker.errors, status: :unprocessable_entity
    end
  end

  # DELETE /workers/1
  def destroy
    authorized?
    @worker.destroy
  end

  private

  def authorized?
    authorize current_user
  end

  def set_worker
    @worker = Worker.find(params[:id])
  end

  def worker_params
    params.require(:worker).permit(:username, :mail, :password, :password_confirmation, :isAdmin)
  end
end
