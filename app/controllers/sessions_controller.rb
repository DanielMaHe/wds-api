# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authorize, only: :create

  # def new; end

  def create
    # render json: { messages: "this create"}
    worker = Worker.find_by(username: params[:session][:username])

    if worker&.authenticate(params[:session][:password])
      # Iniciar sesión exitosamente.
      # session[:worker_id] = worker.id
      worker.regenerate_token
      render json: { token: worker.token }

    else
      # Error de inicio de sesión.
      respond_unauthorized('Incorrect email o password')
    end
  end

  def destroy
    # Cerrar sesión.
    # session[:worker_id] = nil
    current_user.invalid_token
    head :ok
    # redirect_to root_path, notice: "Cierre de sesión exitoso"
  end
end
